import 'package:apex_app/data/api/api_parser.dart';
import 'package:apex_app/modules/auth_page/cubit/auth_page_cubit.dart';
import 'package:apex_app/modules/home_page/cubit/home_cubit.dart';
import 'package:apex_app/modules/legends_page/cubit/legends_cubit.dart';
import 'package:apex_app/modules/settings_page/cubit/settings_cubit.dart';
import 'package:apex_app/modules/statistic_page/cubit/statistic_cubit.dart';
import 'package:apex_app/widgets/page_wrapper/cubit/page_wrapper_cubit.dart';
import 'package:apex_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ApiParser api = ApiParser();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthPageCubit(),
        ),
        BlocProvider(
          create: (_) => HomePageCubit(api),
        ),
        BlocProvider(
          create: (_) => LegendsPageCubit(),
        ),
        BlocProvider(
          create: (_) => StatisticPageCubit(),
        ),
        BlocProvider(
          create: (_) => SettingsPageCubit(),
        ),
        BlocProvider(
          create: (context) => PageWrapperCubit(context, api)..load(),
        ),
      ],
      child: MaterialApp(
        initialRoute: AppPages.authPage,
        routes: AppPages.routes,
      ),
    );
  }
}
