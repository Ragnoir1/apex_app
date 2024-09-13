part of 'auth_page_cubit.dart';

@immutable
abstract class AuthPageState {
  final GamingPlatform selectedPlatform;

  const AuthPageState({required this.selectedPlatform});
}

class AuthPageInitial extends AuthPageState {
  const AuthPageInitial({required super.selectedPlatform});
}

class AuthPageLoading extends AuthPageState {
  const AuthPageLoading({required super.selectedPlatform});
}

class AuthPageLoaded extends AuthPageState {
  const AuthPageLoaded({required super.selectedPlatform});
}
