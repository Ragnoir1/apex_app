import 'package:apex_app/data/api/api_parser.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsPageCubit extends Cubit<SettingsPageState> {
  SettingsPageCubit(this.api) : super(SettingsPageInitial());
  ApiParser api;
}
