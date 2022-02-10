import 'package:appointment/models/prodiModel.dart';
import 'package:appointment/routs.dart';
import 'package:appointment/screens/details/components/config.dart';
import 'package:flutter/material.dart';

class ItemProdi extends StatefulWidget {
  final ProdiModel? data;
  const ItemProdi({Key? key, this.data}) : super(key: key);

  @override
  _ItemProdiState createState() => _ItemProdiState();
}

class _ItemProdiState extends State<ItemProdi> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.data!.namaProdi!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
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
  }
}
