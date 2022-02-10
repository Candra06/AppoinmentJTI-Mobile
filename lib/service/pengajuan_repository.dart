import 'package:appointment/models/eventDosenModel.dart';
import 'package:appointment/models/pengajuanModel.dart';
import 'package:appointment/utill/network.dart';
import 'package:appointment/utill/preference.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PengajuanRepository {
  Future<List<PengajuanModel>> listPengajuanMahasiswa(String idUser) async {
    http.Response req = await http.get(Uri.parse(EndPoint.listPengajuanEvent + idUser));
    var data = json.decode(req.body);
    if (data['status'] == true) {
      List<dynamic> list = data['data'];
      return list.map((e) => PengajuanModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<PengajuanModel>> listPengajuanByDosen(String idUser) async {
    http.Response req = await http.get(Uri.parse(EndPoint.listPengajuanByDosen + idUser));
    var data = json.decode(req.body);
    if (data['status'] == true) {
      List<dynamic> list = data['data'];
      return list.map((e) => PengajuanModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<PengajuanModel?> detailPengajuanMahasiswa(String idPengajuan) async {
    String url = '';
    String role = await Pref.getRole();
    if (role == '2') {
      url = EndPoint.detailPengajuanByDosen + idPengajuan;
    } else {
      url = EndPoint.detailPengajuanEvent + idPengajuan;
    }
    http.Response req = await http.get(Uri.parse(url));
    var data = json.decode(req.body);
    print(data['data']);
    if (data['status'] == true) {
      return PengajuanModel.fromJson(data['data']);
    } else {
      null;
    }
  }

  Future<List<EventDosenModel>> listEventDosenByMahasiswa() async {
    http.Response req = await http.get(Uri.parse(EndPoint.listEventDosen));
    var data = json.decode(req.body);
    if (data['status'] == true) {
      List<dynamic> list = data['data'];
      return list.map((e) => EventDosenModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<List<EventDosenModel>> listEventDosenByDosen(String idUser) async {
    http.Response req = await http.get(Uri.parse(EndPoint.listEvent + idUser));
    var data = json.decode(req.body);
    if (data['status'] == true) {
      List<dynamic> list = data['data'];
      return list.map((e) => EventDosenModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  Future<Map<String, dynamic>?> addEventDosen(String idUser, EventDosenModel body) async {
    print(idUser);
    print(body.toJson());
    http.Response req = await http.post(Uri.parse(EndPoint.createEvent + idUser), body: body.toJson());
    Map<String, dynamic> data = json.decode(req.body);
    print(data);
    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  Future<Map<String, dynamic>?> addEventMahasiswa(String idUser, PengajuanModel body) async {
    print(idUser);
    print(body.toJson());
    http.Response req = await http.post(Uri.parse(EndPoint.createJadwal), body: body.toJson());
    Map<String, dynamic> data = json.decode(req.body);
    print(data);
    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  Future<Map<String, dynamic>?> responJadwal(String idEvent, PengajuanModel body) async {
    print(body.accPengajuan());
    print(EndPoint.responEvent + idEvent);
    http.Response req = await http.post(Uri.parse(EndPoint.responEvent + idEvent), body: body.accPengajuan());
    Map<String, dynamic> data = json.decode(req.body);
    print(data);
    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  Future<Map<String, dynamic>?> batalEventMahasiswa(String idJadwal) async {
    http.Response req = await http.get(Uri.parse(EndPoint.batalEventMahasiswa + idJadwal));
    Map<String, dynamic> data = json.decode(req.body);
    print(data);
    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }

  Future<Map<String, dynamic>?> deleteEventDosen(String idEvent) async {
    http.Response req = await http.get(Uri.parse(EndPoint.deleteEvent + idEvent));
    Map<String, dynamic> data = json.decode(req.body);
    print(data);
    if (data['status'] == true) {
      return data;
    } else {
      return data;
    }
  }
}
