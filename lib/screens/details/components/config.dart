import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Config {
  static Widget statusProspek(String status) {
    switch (status) {
      case 'accept':
        return Container(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Text('Accept', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
        );
        break;
      case 'reject':
        return Container(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Text('Reject', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
        );
        break;
      case 'waiting':
        return Container(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
          decoration: BoxDecoration(color: Colors.yellow[800], borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Text('Waiting', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
        );
        break;

      default:
        return Container(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
          decoration: BoxDecoration(color: Colors.grey[600], borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Text('Batal', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
        );
        break;
    }
  }

  static alert(tipe, pesan) {
    Fluttertoast.showToast(
        msg: pesan,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: (tipe == 1 ? Colors.green : Colors.red), // 1 untuk berhasil
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static formatDateTime(tgl) {
    try {
      var date = tgl.toString().split(" ");
      var bln = ['', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
      var tmpDate = date[0].toString().split(" ");
      var bulan = tmpDate[0].toString().split('-');
      var jam = date[1].toString().split(":");
      String tanggal = bulan[2] + ' ' + bln[int.parse(bulan[1])] + ' ' + bulan[0] + ' ' + jam[0] + ':' + jam[1];
      return tanggal;
    } catch (e) {
      print(e);
      return tgl.toString();
    }
  }

  static formatDateChat(tgl) {
    try {
      var date = tgl.toString().split(" ");
      var bln = ['', 'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
      var tmpDate = date[0].toString().split(" ");
      var bulan = tmpDate[0].toString().split('-');
      var jam = date[1].toString().split(":");
      String tanggal = bulan[2] + '/' + bulan[1] + '/' + bulan[0] + ' ' + jam[0] + ':' + jam[1];
      return tanggal;
    } catch (e) {
      print(e);
      return tgl.toString();
    }
  }
}
