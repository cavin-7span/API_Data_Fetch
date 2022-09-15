import 'dart:io';
import 'package:demo_crud/base/app_exception.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart';

class AppGraphQlClient {
  GraphQLClient? _client;

  AppGraphQlClient(
    String graphQlUrl,
  ) {
    final httpLink = HttpLink(
      graphQlUrl,
    );

    _client = GraphQLClient(
      cache: GraphQLCache(
          // dataIdFromObject: typenameDataIdFromObject,
          ),
      defaultPolicies: DefaultPolicies(
        query: Policies(
          fetch: FetchPolicy.noCache,
        ),
        watchQuery: Policies(
          fetch: FetchPolicy.noCache,
        ),
      ),
      link: httpLink,
    );
  }

  /// Perform query
  Stream<Map<String, dynamic>> query(QueryOptions options) {
    return _client!
        .query(options)
        .timeout(const Duration(seconds: 60), onTimeout: () {
          throw AppException(
              message: 'Server not responding please go back and try again.');
        })
        .asStream()
        .map((result) {
          print('//// exception: ${result.exception?.toString()}');
          if (result.exception != null) {
            throw AppException(
                message: _getErrorMessage(
                    result.exception ?? OperationException(), true));
          }
          return result.data!; //.data;
        });
  }

  /// Perform query by passing query string.
  Stream<Map<String, dynamic>?> queryString(String query, {Duration? timeout}) {
    // var metric = FirebasePerformanceHelper.startFirebaseQueryTrace(query);
    return _client!
        .query(QueryOptions(document: gql(query)))
        .timeout(timeout ?? const Duration(seconds: 60), onTimeout: () {
          throw AppException(
              message: 'Server not responding please go back and try again.');
        })
        .asStream()
        .map((result) {
          print('//// exception: ${result.exception.toString()}');
          if (result.exception != null) {
            throw AppException(
                message: _getErrorMessage(
                    result.exception ?? OperationException(), true));
          }
          // metric?.stop();
          return result.data; //.data;
        });
  }

  /// Perform mutation
  Stream<Map<String, dynamic>?> mutate(MutationOptions options) {
    return _client!
        .mutate(options)
        .timeout(const Duration(seconds: 60), onTimeout: () {
          throw AppException(
              message: 'Server not responding please go back and try again.');
        })
        .asStream()
        .map((result) {
          print('//// exception: ${result.exception.toString()}');
          if (result.exception != null) {
            throw AppException(
                message: _getErrorMessage(
                    result.exception ?? OperationException(), false));
          }
          return result.data;
        });
  }

  /// Perform mutation by passing query string
  Stream<Map<String, dynamic>?> mutateString(String query,
      {required Map<String, dynamic> variables}) {
    // var metric = FirebasePerformanceHelper.startFirebaseQueryTrace(query);
    return _client!
        .mutate(MutationOptions(document: gql(query), variables: variables))
        .timeout(const Duration(seconds: 60), onTimeout: () {
          throw AppException(
              message: 'Server not responding please go back and try again.');
        })
        .asStream()
        .map((result) {
          print('//// exception: ${result.exception.toString()}');
          if (result.exception != null) {
            throw AppException(
                message: _getErrorMessage(
                    result.exception ?? OperationException(), false));
          }
          // metric?.stop();
          return result.data;
        });
  }

  String? _getErrorMessage(OperationException? exception, bool isQuery) {
    if (exception == null) return null;
    if (exception.linkException != null) {
      print("_getErrorMessage");
      final error = exception.linkException ?? null;
      dynamic errorMessage = error?.originalException ?? null;
      print(
          "_getErrorMessage error.originalException ${error?.originalException.toString()}");
      if (errorMessage is String &&
          (errorMessage.contains('User not found') == true ||
              errorMessage.contains('Token expired') == true ||
              errorMessage.contains('Invalid token') == true)) {
        // SessionExpirationHelper().sessionExpirationStream.add(true);
      }
      if (error is ServerException &&
          error.originalException is SocketException) {
        return 'msg_no_internet_connection';
      }
      if (error is NetworkException &&
          error.originalException is ClientException) {
        return "msg_no_internet_connection";
      }
    }
    if (exception.graphqlErrors.isNotEmpty == true) {
      String? message = exception.graphqlErrors[0].message;
      final error = exception.graphqlErrors[0].extensions;
      if (error is Map && error != null) {
        final errorMessage = error[0] ?? error.values.first[0].toString();
        message = errorMessage;
        print("$errorMessage");
      }
      return message;
    }

    // SentryClientHelper().capture(exception, null);
    return isQuery
        ? 'Failed to load data, try again'
        : 'Failed to update data, try again';
  }
}
