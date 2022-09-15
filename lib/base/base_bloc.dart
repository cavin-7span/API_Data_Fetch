import 'package:demo_crud/base/base_ui_state.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  final subscriptions = CompositeSubscription();
  final hideKeyboardSubject = PublishSubject<bool>();
  final event = PublishSubject<BaseEvent>();
  final state = PublishSubject<BaseUiState>();

  void hideKeyboard() {
    print('/// hide called');
    hideKeyboardSubject.add(true);
  }

  void dispose() {
    subscriptions.clear();
    hideKeyboardSubject.close();
    event.close();
    state.close();
  }
}

class BaseEvent<T> {
  T? data;

  BaseEvent({
    this.data,
  });
}
