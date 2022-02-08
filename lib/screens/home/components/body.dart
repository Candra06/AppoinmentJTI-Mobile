import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../../size_config.dart';
import 'the_banner.dart';

class HomeBodyMahasiswa extends StatefulWidget {
  const HomeBodyMahasiswa({Key? key}) : super(key: key);

  @override
  _HomeBodyMahasiswaState createState() => _HomeBodyMahasiswaState();
}

class _HomeBodyMahasiswaState extends State<HomeBodyMahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.JADWAL_DOSEN);
              },
              icon: Icon(Icons.add))
        ],
        title: Text(
          'Jadwal Saya',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (BuildContext context, int i) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.DETAIL_JADWAL, arguments: '1');
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Judul Jadwal', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                              Config.statusProspek('waiting'),
                            ],
                          ),
                          Text('Nama Dosen'),
                          SizedBox(
                            height: 8,
                          ),
                          // Text('Keterangan'),
                          // Text('Lorem Ipsum'),
                          // SizedBox(
                          //   height: 8,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text('Tanggal Mulai'),
                          //     Text('Tanggal Selesai'),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text('22 Februari 2022 (08.00)'),
                          //     Text('22 Februari 2022 (08.00)'),
                          //   ],
                          // ),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
