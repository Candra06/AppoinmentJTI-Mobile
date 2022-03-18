import 'dart:convert';

import 'package:appointment/models/prodiModel.dart';
import 'package:appointment/models/replyModel.dart';
import 'package:appointment/models/topicModel.dart';
import 'package:appointment/models/userModel.dart';
import 'package:appointment/utill/network.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  // request data user
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

  Future<Map<String, dynamic>?> postUser(UserModel body) async {
    http.Response res = await http.post(Uri.parse(EndPoint.postUser), body: body.toJson());
    Map<String, dynamic> data = json.decode(res.body);
    print(data);
    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  Future<Map<String, dynamic>?> updateUser(UserModel body, String idUser) async {
    http.Response res = await http.post(Uri.parse(EndPoint.updateUser + idUser), body: body.toJson());
    Map<String, dynamic> data = json.decode(res.body);

    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  Future<Map<String, dynamic>?> deleteUser(String id) async {
    http.Response res = await http.get(Uri.parse(EndPoint.deleteUser + id));
    Map<String, dynamic> data = json.decode(res.body);

    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  //request data prodi
  Future<Map<String, dynamic>?> postProdi(ProdiModel body) async {
    http.Response res = await http.post(Uri.parse(EndPoint.postProdi), body: body.toJson());
    Map<String, dynamic> data = json.decode(res.body);

    if (data['status'] == true) {
      return data;
    } else {
      return data;
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

  Future<ProdiModel?> detailProdi(String idProdi) async {
    http.Response req = await http.get(Uri.parse(EndPoint.detailProdi + idProdi));
    var data = json.decode(req.body);

    if (req.statusCode == 200) {
      return ProdiModel.fromJson(data['data']);
    } else {
      null;
    }
  }

  Future<Map<String, dynamic>?> deleteProdi(String idProdi) async {
    http.Response req = await http.get(Uri.parse(EndPoint.deleteProdi + idProdi));
    Map<String, dynamic> data = json.decode(req.body);

    if (data['status'] == true) {
      return data;
    } else {
      null;
    }
  }

  Future<Map<String, dynamic>?> updateProdi(ProdiModel body, String idProdi) async {
    http.Response res = await http.post(Uri.parse(EndPoint.updateProdi + idProdi), body: body.toJson());
    Map<String, dynamic> data = json.decode(res.body);

    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  // requet chat
  Future<Map<String, dynamic>?> postTopic(TopicModel body) async {
    http.Response res = await http.post(Uri.parse(EndPoint.addTopic), body: body.toJson());
    Map<String, dynamic> data = json.decode(res.body);

    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  Future<List<TopicModel>> listTopic(String idUser) async {
    http.Response req = await http.get(Uri.parse(EndPoint.listTopic + idUser));
    var data = json.decode(req.body);

    if (data['status'] == true) {
      List<dynamic> list = data['data'];

      return list.map((e) => TopicModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<ReplyModel>>? detailChat(String idChat) async {
    Map<dynamic, dynamic> body = {'id': idChat};
    http.Response req = await http.post(Uri.parse(EndPoint.detailChat), body: body);
    var data = json.decode(req.body);
    print(req.body);
    if (data['status'] == true) {
      List<dynamic> list = data['data'];

      return list.map((e) => ReplyModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>?> replyChat(ReplyModel body) async {
    http.Response res = await http.post(Uri.parse(EndPoint.replyChat), body: body.toJson());
    Map<String, dynamic> data = json.decode(res.body);

    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }
}
