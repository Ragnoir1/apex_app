import 'package:apex_app/extensions/padding.dart';
import 'package:apex_app/modules/home_page/cubit/home_cubit.dart';
import 'package:apex_app/widgets/app_scaffold.dart';
import 'package:apex_app/widgets/progress_bar_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageCubit, HomePageState>(
      builder: (context, state) => AppScaffold(
        title: "Главная",
        body: state is HomePageStateLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : Column(
                children: [
                  nameUser(state).paddingOnly(top: 32),
                  ProgressBarLevel(
                    toNextLevelPercent: state.profile.toNextLevelPercent,
                  ).paddingOnly(top: 16),
                  Container(
                    alignment: Alignment.center,
                    height: 492,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.network(
                          state.legend.icon,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const CircularProgressIndicator(
                              color: Colors.red,
                            );
                          },
                        ).paddingOnly(top: 32),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget nameUser(HomePageState state) {
    return Column(
      children: [
        Text(
          state.profile.tag.isNotEmpty
              ? ("[${state.profile.tag}]${state.profile.name}")
              : state.profile.name,
          style: const TextStyle(
              fontFamily: 'Apex',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
        Text(
          "Lvl ${state.profile.level}",
          style: const TextStyle(
              fontFamily: 'Apex',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ).paddingOnly(top: 16)
      ],
    );
  }
}
