import 'package:appointment/screens/details/components/config.dart';
import 'package:appointment/service/sercive_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import '../../../size_config.dart';

class EventDosenBody extends StatefulWidget {
  const EventDosenBody({Key? key}) : super(key: key);

  @override
  _EventDosenBodyState createState() => _EventDosenBodyState();
}

class _EventDosenBodyState extends State<EventDosenBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int i) {
              return InkWell(
                onTap: () {},
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
                            // Config.statusProspek('waiting'),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tanggal Mulai'),
                            Text('Tanggal Selesai'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('22 Februari 2022 (08.00)'),
                            Text('22 Februari 2022 (08.00)'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
