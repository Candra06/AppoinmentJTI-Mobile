import 'package:shared_preferences/shared_preferences.dart';

class IpSetting {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void setIp(String ips) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString('ip', ips);
  }
}
