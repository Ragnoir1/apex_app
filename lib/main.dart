import 'package:apex_app/data/api/api_parser.dart';
import 'package:apex_app/data/session_data_provider.dart';
import 'package:apex_app/modules/auth_page/cubit/auth_page_cubit.dart';
import 'package:apex_app/modules/home_page/cubit/home_cubit.dart';
import 'package:apex_app/modules/legends_page/cubit/legends_cubit.dart';
import 'package:apex_app/modules/settings_page/cubit/settings_cubit.dart';
import 'package:apex_app/modules/statistic_page/cubit/statistic_cubit.dart';
import 'package:apex_app/widgets/page_wrapper/cubit/page_wrapper_cubit.dart';
import 'package:apex_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SessionDataProvider session = SessionDataProvider();
  await session.checkAuth();
  runApp(MyApp(session: session));
}

class MyApp extends StatelessWidget {
  final SessionDataProvider session;

  const MyApp({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    ApiParser api = ApiParser();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthPageCubit(api),
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
          create: (context) => PageWrapperCubit(context, api, session)..load(),
        ),
      ],
      child: MaterialApp(
        initialRoute: session.isAuth ? AppPages.pageWrapper : AppPages.authPage,
        routes: AppPages.routes,
      ),
    );
  }
}
