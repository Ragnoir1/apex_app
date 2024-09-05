part of 'home_cubit.dart';

@immutable
abstract class HomePageState {
  final Profile profile;
  final Legend legend;

  const HomePageState(this.profile, this.legend);
}

class HomePageStateInitial extends HomePageState {
  const HomePageStateInitial(super.profile, super.legend);
}

class HomePageStateLoading extends HomePageState {
  const HomePageStateLoading(super.profile, super.legend);
}

class HomePageStateLoaded extends HomePageState {
  const HomePageStateLoaded(super.profile, super.legend);
}
