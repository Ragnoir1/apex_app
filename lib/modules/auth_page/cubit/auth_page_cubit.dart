import 'package:apex_app/data/api/api_client.dart';
import 'package:apex_app/resourses/images.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit()
      : super(const AuthPageInitial(selectedPlatform: GamingPlatform.pc));

  Image getImageSelectedPlatform(GamingPlatform type) {
    switch (type) {
      case GamingPlatform.pc:
        return Image(image: windowsIcon, color: Colors.white);
      case GamingPlatform.ps:
        return Image(image: playstationIcon, color: Colors.white);
      case GamingPlatform.xbox:
        return Image(image: xboxIcon, color: Colors.white);
    }
  }

  changePlatform(GamingPlatform type) {
    switch (type) {
      case GamingPlatform.pc:
        emit(const AuthPageLoaded(selectedPlatform: GamingPlatform.pc));
      case GamingPlatform.ps:
        emit(const AuthPageLoaded(selectedPlatform: GamingPlatform.ps));
      case GamingPlatform.xbox:
        emit(const AuthPageLoaded(selectedPlatform: GamingPlatform.xbox));
    }
  }
}
