import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio = Dio();
  Response? response;

  Future<void> allStatisticProfileApi() async {
    response = await dio.get(
        'https://api.mozambiquehe.re/bridge?auth=be23b0a07071190e1e3d796133cce598&player=Huxtron&platform=PC');
  }
}
