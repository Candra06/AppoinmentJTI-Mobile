// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';
import 'package:appointment/models/AuhtModel.dart';
import 'package:appointment/utill/network.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late bool _status = false;
  late bool _isNull = false;
  late String _ip = "";

  List<dynamic> _data = [];
  Map<String, dynamic> _length = {};

  bool get status => _status;
  bool get isNull => _isNull;
  List<dynamic> get data => _data;

  Map<String, dynamic> get length => _length;

  String get url => "https://appointmentjti.waserdajaya.store/";

  String get imageUrl => "https://appointmentjti.waserdajaya.store/assets/img/profile/";

  Future<void> getChat() async {
    final SharedPreferences prefs = await _prefs;
    _data = [];
    http.Response hasilRespon = await http.post(Uri.parse(this.url + "chat"),
        body: {'id': prefs.getString("id_user".toString())}, headers: {'Content-Type': 'application/x-www-form-urlencoded', 'Cookie': 'ci_session=ttrcome6mjbi616q28pcaol47908sjat'});
    // print(hasilRespon.body);
    if (hasilRespon.statusCode == 200) {
      return _data = json.decode(hasilRespon.body)["data"];
    }
    notifyListeners();
    // if (hasilRespon.statusCode != 200) {
    //   try {
    //     // print(data);
    //   } catch (e) {
    //     // return e.;
    //   }
    // }
  }

  Future<void> listChat({required String id}) async {
    _data = [];
    http.Response hasilRespon = await http.post(Uri.parse(this.url + "chat/rechat"), body: {
      'id': id,
    }, headers: {
      'Cookie': 'ci_session=hicugh25of2gedocb4b4hmrt4jkg7h81'
    });
    print(hasilRespon.body);
    if (hasilRespon.statusCode != 200) {
      try {
        _data = json.decode(hasilRespon.body)["data"];
      } catch (e) {
        _data = [];
      }
    }
    notifyListeners();
  }

  Future<void> postChat({required String id, required String message}) async {
    final SharedPreferences prefs = await _prefs;

    var hasilRespon = await http.post(Uri.parse(this.url + "chat/send"),
        body: {'id_chat': id, 'from_by': prefs.getString("id_user").toString(), 'message': message}, headers: {'Cookie': 'ci_session=hicugh25of2gedocb4b4hmrt4jkg7h81'});
    if (hasilRespon.statusCode != 200) {
      try {
        _data = json.decode(hasilRespon.body)["data"];
      } catch (e) {
        _data = [];
      }
    }
    notifyListeners();
  }

  Future<void> getRequest() async {
    final SharedPreferences prefs = await _prefs;
    _data = [];

    var hasilRespon = await http.post(Uri.parse(this.url + "Request"),
        body: {'id': prefs.getString("id_user").toString(), 'roleId': prefs.getString("id_role".toString())}, headers: {'Cookie': 'ci_session=hicugh25of2gedocb4b4hmrt4jkg7h81'});
    if (hasilRespon.statusCode != 200) {
      try {
        _data = json.decode(hasilRespon.body)["data"];
      } catch (e) {
        _data = [];
      }
    }
    // notifyListeners();
  }

  Future<void> getUser() async {
    final SharedPreferences prefs = await _prefs;
    _data = [];
    var hasilRespon = await http.post(Uri.parse(this.url + "user"), body: {
      'email': prefs.getString("email").toString(),
      // 'email': "ekkyrahmanx1@gmail.com",
    }, headers: {
      'Cookie': 'ci_session=hicugh25of2gedocb4b4hmrt4jkg7h81'
    });
    if (hasilRespon.statusCode != 200) {
      _data = json.decode(hasilRespon.body)["data"];
    }
    // notifyListeners();
  }

  Future<bool?> authentification({required String? email, required String? password}) async {
    final SharedPreferences prefs = await _prefs;

    var hasilRespon = await http.post(Uri.parse(EndPoint.auth), body: {
      'email': email,
      'password': password,
    }, headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Cookie': 'ci_session=j0rduujlvc2r8raudcpdo7kep0225dnq'
    });
    print(hasilRespon.body);
    _status = json.decode(hasilRespon.body)["status"];
    // print(hasilRespon.body);
    if (hasilRespon.statusCode <= 201) {
      prefs.setString('email', json.decode(hasilRespon.body)["data"]["email"]);
      prefs.setString('id_user', json.decode(hasilRespon.body)["data"]["id_user"]);
      prefs.setString('id_role', json.decode(hasilRespon.body)["data"]["id_role"]);
      prefs.setString('image', json.decode(hasilRespon.body)["data"]["image"]);
      return true;
    }
    notifyListeners();
    return false;
  }

  Future<void> postJadwal({required String title, required String id, String startDate = "", String endDate = ""}) async {
    final SharedPreferences prefs = await _prefs;

    var hasilRespon = await http.post(Uri.parse(this.url + "jadwal/make"), body: {
      'user': prefs.getString("id_user").toString(),
      'title': title,
      'start': startDate,
      'end': endDate,
    }, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    });
    if (hasilRespon.statusCode != 200) {
      try {
        _data = json.decode(hasilRespon.body)["data"];
      } catch (e) {
        _data = [];
      }
    }
    // notifyListeners();
  }

  Future<void> putJadwal({
    required String id,
    required String status,
  }) async {
    var hasilRespon = await http.put(Uri.parse(this.url + "jadwal"), body: {'id': id, 'status': status, 'message': 'kamu ${status}'}, headers: {'Content-Type': 'application/x-www-form-urlencoded'});

    if (hasilRespon.statusCode != 200) {
      try {
        print("Success");
      } catch (e) {
        print(e);
      }
    }
  }

  Future<void> postRequest({required String title, required String dosen, String startDate = "", String endDate = ""}) async {
    final SharedPreferences prefs = await _prefs;
    var hasilRespon = await http.post(Uri.parse(this.url + "request/make"), body: {
      'mahasiswa': prefs.getString("id_user").toString(),
      'dosen': dosen,
      'title': title,
      'start': startDate,
      'end': endDate,
    }, headers: {
      'Content-Type': 'application/x-www-form-urlencoded'
    });
    if (hasilRespon.statusCode != 200) {
      try {
        _data = json.decode(hasilRespon.body)["data"];
      } catch (e) {
        _data = [];
      }
    }
    // notifyListeners();
  }

  Future<void> getJumlah() async {
    var hasilRespon = await http.post(Uri.parse(this.url + "jumlah"), body: {}, headers: {'Cookie': 'ci_session=hicugh25of2gedocb4b4hmrt4jkg7h81'});
    _status = json.decode(hasilRespon.body)["status"];
    _length = json.decode(hasilRespon.body)["data"];
    // print(hasilRespon.body);
  }
}
