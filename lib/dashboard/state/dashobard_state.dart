import 'package:demo_crud/base/base_ui_state.dart';
import 'package:demo_crud/dashboard/model/country_model.dart';
import 'package:demo_crud/dashboard/model/dashboard_model.dart';

class DashboardState extends BaseUiState<CountryModel> {
  DashboardState.loading() : super.loading();

  DashboardState.completed(CountryModel data) : super.completed(data: data);

  DashboardState.error(dynamic error) : super.error(error);
}
