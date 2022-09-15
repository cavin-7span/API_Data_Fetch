import 'package:demo_crud/base/base_bloc.dart';
import 'package:demo_crud/dashboard/model/dashboard_model.dart';
import 'package:demo_crud/dashboard/repo/dashboard_repo.dart';
import 'package:demo_crud/dashboard/source/dashboard_graphql_request.dart';
import 'package:demo_crud/dashboard/state/dashobard_state.dart';
import 'package:demo_crud/main.dart';
import 'package:rxdart/rxdart.dart';

class DashBoardBloc extends BaseBloc {
  DashboardRepo? dashboardRepo;
  DashBoardBloc(this.dashboardRepo) {
    getCountry();
  }

  final dashboardState = BehaviorSubject<DashboardState>();
  final countryDataStream = BehaviorSubject<List<DashboardModel>?>();

  void getCountry() {
    subscriptions
        .add(_getCountry().listen((state) {
      if (state.isCompleted()) {
        print("Data: ${state.data?.dashboardModel}");
        countryDataStream.add(state.data?.dashboardModel);
      }
      dashboardState.add(state);
    }, onError: (error) {}));
  }

  Stream<DashboardState> _getCountry() {
    return dashboardRepo!
        .getCountries()
        .map((event) => DashboardState.completed(event))
        .onErrorReturnWith((error, dynamic) => DashboardState.error(error))
        .startWith(DashboardState.loading());
  }
}
