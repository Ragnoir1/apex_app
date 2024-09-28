import 'package:apex_app/data/api/api_client.dart';
import 'package:apex_app/resourses/images.dart';
import 'package:apex_app/routes/app_pages.dart';
import 'package:apex_app/widgets/custom_textfield.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_page_state.dart';

class AuthPageCubit extends Cubit<AuthPageState> {
  AuthPageCubit()
      : super(const AuthPageInitial(selectedPlatform: GamingPlatform.pc)) {
    focusNode.addListener(_handleFocusChange);
  }
  final api = ApiClient();
  final TextEditingController textEditingController = TextEditingController();
  final ValueNotifier<bool> isVisible = ValueNotifier<bool>(focusNode.hasFocus);

  void _handleFocusChange() {
    isVisible.value = focusNode.hasFocus;
  }

  Future<void> auth(BuildContext context, GamingPlatform type) async {
    await api.request(textEditingController.text, type);
    api.response != null
        ? Navigator.of(context).pushReplacementNamed(AppPages.pageWrapper)
        : print("Стоп");
  }

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
