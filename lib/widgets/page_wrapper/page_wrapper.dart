import 'package:apex_app/modules/home_page/home_page_view.dart';
import 'package:apex_app/modules/legends_page/legends_page_view.dart';
import 'package:apex_app/modules/settings_page/settings_page_view.dart';
import 'package:apex_app/modules/statistic_page/statistic_page_view.dart';
import 'package:apex_app/resourses/colors.dart';
import 'package:apex_app/widgets/app_scaffold.dart';
import 'package:apex_app/widgets/page_wrapper/cubit/page_wrapper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class PageWrapper extends StatelessWidget {
  const PageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.read<PageWrapperCubit>().currentIndex,
      builder: (_, currentIndex, __) =>
          BlocBuilder<PageWrapperCubit, PageWrapperState>(
        builder: (context, state) => Scaffold(
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (e) => context.read<PageWrapperCubit>().onTap(e),
            currentIndex: currentIndex,
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.4),
            selectedItemColor: AppColors.activeColor,
            unselectedItemColor: AppColors.unselectedItemColor,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Iconsax.home),
                label: "Главная",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.user_tag),
                label: "Легенды",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.graph4),
                label: "Статистика",
              ),
              BottomNavigationBarItem(
                icon: Icon(Iconsax.setting),
                label: "Настройки",
              ),
            ],
          ),
          body: state is PageWrapperStateLoading
              ? AppScaffold(
                  body: CircularProgressIndicator(
                  color: Colors.red,
                ))
              : body(currentIndex),
        ),
      ),
    );
  }

  Widget body(int currentIndex) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: currentIndex == 0
          ? const HomePageView()
          : currentIndex == 1
              ? const LegendsPageView()
              : currentIndex == 2
                  ? const StatisticPageView()
                  : const SettingsPageView(),
    );
  }
}
