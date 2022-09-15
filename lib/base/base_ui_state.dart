class BaseUiState<T> {
  BaseUiState();

  /// Holds error if state is [UiState.error]
  dynamic error;

  /// Holds data if state is [UiState.completed]
  T? data;

  /// Holds current [UiState]
  UiState? _state;

  /// Returns [BaseUiState] with [UiState.loading]
  BaseUiState.loading() : _state = UiState.loading;

  /// Returns [BaseUiState] with [UiState.completed]
  BaseUiState.completed({this.data}) : _state = UiState.completed;

  /// Returns [BaseUiState] with [UiState.error]
  BaseUiState.error(this.error) : _state = UiState.error;

  /// Returns true if the current [state] is [UiState.loading]
  bool isLoading() => _state == UiState.loading;

  /// Returns true if the current [state] is [UiState.completed]
  bool isCompleted() => _state == UiState.completed;

  bool isError() => _state == null || _state == UiState.error;

  /// Returns true if the current [state] is [UiState.error]

  @override
  String toString() {
    return 'State is $_state';
  }
}

/// UI States
enum UiState {
  loading,
  completed,
  error,
}
