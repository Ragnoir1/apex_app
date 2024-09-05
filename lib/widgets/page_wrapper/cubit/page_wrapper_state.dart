part of 'page_wrapper_cubit.dart';

@immutable
abstract class PageWrapperState {
  final dynamic response;

  const PageWrapperState({required this.response});
}

class PageWrapperStateInitial extends PageWrapperState {
  const PageWrapperStateInitial({required super.response});
}

class PageWrapperStateLoading extends PageWrapperState {
  const PageWrapperStateLoading({required super.response});
}

class PageWrapperStateLoaded extends PageWrapperState {
  const PageWrapperStateLoaded({required super.response});
}
