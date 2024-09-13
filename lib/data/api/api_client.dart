import 'package:dio/dio.dart';

enum GamingPlatform { pc, ps, xbox }

class ApiClient {
  final Dio dio = Dio();
  Response? response;
  static const String path =
      'https://api.mozambiquehe.re/bridge?auth=be23b0a07071190e1e3d796133cce598&';
  static const String pcPlatform = 'PC';
  static const String psPlatform = 'PS4';
  static const String xboxPlatform = 'X1';
  String? platform;

  Future<void> allStatisticProfileApi() async {
    response = await dio.get(
        'https://api.mozambiquehe.re/bridge?auth=be23b0a07071190e1e3d796133cce598&player=Huxtron&platform=PC');
  }

  void getGamingPlatform(GamingPlatform type) {
    switch (type) {
      case GamingPlatform.pc:
        platform = pcPlatform;
      case GamingPlatform.ps:
        platform = psPlatform;
      case GamingPlatform.xbox:
        platform = xboxPlatform;
    }
  }
}
