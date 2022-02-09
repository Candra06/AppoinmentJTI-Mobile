import 'package:appointment/models/userModel.dart';
import 'package:appointment/routs.dart';
import 'package:flutter/material.dart';

class ItemDosen extends StatefulWidget {
  final UserModel? data;
  const ItemDosen({Key? key, this.data}) : super(key: key);

  @override
  _ItemDosenState createState() => _ItemDosenState();
}

class _ItemDosenState extends State<ItemDosen> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.DETAIL_DOSEN, arguments: widget.data!.idUser);
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
                  Text(widget.data!.name!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  // Text('NIM'),
                ],
              ),
              Text(
                widget.data!.email!,
                style: TextStyle(color: Colors.grey),
              ),
              Text(widget.data!.nipNim!),

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
