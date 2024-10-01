import 'package:apex_app/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionDataProvider {
  final _api = ApiClient();
  final _storage = SharedPreferences.getInstance();
  var _isAuth = false;
  String? _player;
  String? _platform;
  bool get isAuth => _isAuth;
  String? get player => _player;

  Future<String?> getPlayer() async {
    final storage = await _storage;
    final name = storage.getString('name');
    return name;
  }

  Future<String?> getPlatform() async {
    final storage = await _storage;
    final platform = storage.getString('platform');
    return platform;
  }

  Future<void> loadData(String? platform) async {
    _player = await getPlayer();
    _platform = await getPlatform();
    platform = _platform;
  }

  Future<void> savePlayer(String player, GamingPlatform type) async {
    final storage = await _storage;

    _api.getGamingPlatformFromType(type);
    final platform = _api.platform;
    storage.setString('platform', platform!);
    storage.setString('name', player);
  }

  Future<void> deletPlayer() async {
    final storage = await _storage;
    storage.clear();
  }

  Future<void> checkAuth() async {
    final player = await getPlayer();
    _isAuth = player != null;
    print(isAuth);
  }
}
