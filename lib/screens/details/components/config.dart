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

      default:
        return Container(
          padding: EdgeInsets.fromLTRB(15, 4, 15, 4),
          decoration: BoxDecoration(color: Colors.yellow[800], borderRadius: BorderRadius.all(Radius.circular(8))),
          child: Text('Waiting', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white)),
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
}
