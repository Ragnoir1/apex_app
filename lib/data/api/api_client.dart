import 'package:dio/dio.dart';

enum GamingPlatform { pc, ps, xbox }

class ApiClient {
  final Dio _dio = Dio();
  Response? response;
  static const String _host = 'https://api.mozambiquehe.re/bridge?';
  static const String _userKey = 'be23b0a07071190e1e3d796133cce598';
  static const String pcPlatform = 'PC';
  static const String psPlatform = 'PS4';
  static const String xboxPlatform = 'X1';
  String? platform;

  Future<void> request(String player,
      [GamingPlatform type = GamingPlatform.pc]) async {
    if (platform == null) {
      getGamingPlatformFromType(type);
    }
    try {
      final resp = await _dio
          .get('${_host}auth=$_userKey&player=$player&platform=$platform');
      response = resp;
    } catch (e) {
      print("Ошибка");
    }
  }

  void getGamingPlatformFromType(GamingPlatform type) {
    switch (type) {
      case GamingPlatform.pc:
        platform = pcPlatform;
      case GamingPlatform.ps:
        platform = psPlatform;
      case GamingPlatform.xbox:
        platform = xboxPlatform;
    }
  }

  GamingPlatform getGamingPlatformInType(String type) {
    switch (type) {
      case pcPlatform:
        return GamingPlatform.pc;
      case psPlatform:
        return GamingPlatform.ps;
      case xboxPlatform:
        return GamingPlatform.xbox;
      default:
        return GamingPlatform.pc;
    }
  }
}
