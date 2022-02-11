// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatViewScreen extends StatefulWidget {
  final String? idDetail;
  final String? nama;
  const ChatViewScreen({Key? key, this.idDetail, this.nama}) : super(key: key);

  @override
  _ChatViewScreenState createState() => _ChatViewScreenState();
}

class _ChatViewScreenState extends State<ChatViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.nama!,
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      body: Body(
        id: widget.idDetail,
      ),
    );
  }
}
