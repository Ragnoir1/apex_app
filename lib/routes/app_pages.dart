import 'package:apex_app/modules/auth_page/auth_page_view.dart';
import 'package:apex_app/modules/home_page/home_page_view.dart';
import 'package:apex_app/modules/legends_page/legends_page_view.dart';
import 'package:apex_app/widgets/page_wrapper/page_wrapper.dart';

class AppPages {
  AppPages._();
  static const authPage = '/auth-page';
  static const homePage = '/home-page';
  static const legendsPage = '/legends-page';
  static const pageWrapper = '/page-wrapper';

  static final routes = {
    AppPages.authPage: (_) => const AuthPageView(),
    AppPages.homePage: (_) => const HomePageView(),
    AppPages.legendsPage: (_) => const LegendsPageView(),
    AppPages.pageWrapper: (_) => const PageWrapper(),
  };
}
