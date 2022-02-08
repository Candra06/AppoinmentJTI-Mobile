import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static getNama() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? nama = preferences.getString('username');
    return nama;
  }

  static getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? email = preferences.getString('email');
    return email;
  }

  static getRole() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id_role = preferences.getString('id_role');
    return id_role;
  }

  static getIDUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? id_user = preferences.getString('id_user');
    return id_user;
  }

  static getFoto() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? image = preferences.getString('image');
    return image;
  }
}
