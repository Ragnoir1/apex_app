import 'package:apex_app/data/api/api_parser.dart';
import 'package:apex_app/data/session_data_provider.dart';
import 'package:apex_app/modules/home_page/cubit/home_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'page_wrapper_state.dart';

class PageWrapperCubit extends Cubit<PageWrapperState> {
  PageWrapperCubit(this.context, this.api, this.session)
      : super(const PageWrapperStateInitial(response: null));

  final BuildContext context;
  ApiParser api;
  SessionDataProvider session;
  ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

  void load() async {
    currentIndex.value = 0;
    emit(PageWrapperStateLoading(response: state.response));
    if (session.isAuth == true) {
      // await session.deletPlayer();
      await session.loadSession();
      await api.request(session.player!, session.platform);
    }
    context.read<HomePageCubit>().load();
    if (api.response != null) {
      emit(PageWrapperStateLoaded(response: api.response!.data));
    }
  }

  onTap(int e) {
    if (e != currentIndex.value) {
      currentIndex.value = e;
    }
  }
}
