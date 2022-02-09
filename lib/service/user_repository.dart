import 'dart:convert';

import 'package:appointment/models/prodiModel.dart';
import 'package:appointment/models/userModel.dart';
import 'package:appointment/utill/network.dart';
import 'package:appointment/utill/preference.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<UserModel>> listUser(String idRole) async {
    http.Response req = await http.get(Uri.parse(EndPoint.listUser + idRole));
    var data = json.decode(req.body);

    if (data['status'] == true) {
      List<dynamic> list = data['data'];

      return list.map((e) => UserModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<UserModel?> detailUser(String idUser) async {
    http.Response req = await http.get(Uri.parse(EndPoint.detailUser + idUser));
    var data = json.decode(req.body);

    if (req.statusCode == 200) {
      return UserModel.fromJson(data['data']);
    } else {
      null;
    }
  }

  Future<List<ProdiModel>> listProdi() async {
    http.Response req = await http.get(Uri.parse(EndPoint.listProdi));
    var data = json.decode(req.body);

    if (data['status'] == true) {
      List<dynamic> list = data['data'];

      return list.map((e) => ProdiModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>?> postUser(UserModel body) async {
    http.Response res = await http.post(Uri.parse(EndPoint.postUser), body: body.toJson());
    Map<String, dynamic> data = json.decode(res.body);
    // print(data);
    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

   Future<Map<String, dynamic>?> postProdi(ProdiModel body) async {
    http.Response res = await http.post(Uri.parse(EndPoint.postUser), body: body.toJson());
    Map<String, dynamic> data = json.decode(res.body);
    // print(data);
    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }
}
