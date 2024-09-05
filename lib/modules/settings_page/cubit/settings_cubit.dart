import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'settings_state.dart';

class SettingsPageCubit extends Cubit<SettingsPageState> {
  SettingsPageCubit() : super(SettingsPageInitial());
}
