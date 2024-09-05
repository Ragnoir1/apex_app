import 'package:apex_app/data/api/api_parser.dart';
import 'package:apex_app/models/legend.dart';
import 'package:apex_app/models/profile.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.api)
      : super(HomePageStateInitial(Profile.empty(), Legend.empty()));
  final ApiParser api;

  void load() {
    emit(HomePageStateLoading(state.profile, state.legend));
    final profile = api.getProfileApi();
    final legend = api.getSelectedLegends();
    if ((profile != null) && (legend != null)) {
      emit(HomePageStateLoaded(profile, legend));
    }
  }
}
