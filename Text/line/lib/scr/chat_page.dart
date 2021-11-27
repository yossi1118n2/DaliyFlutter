import 'package:flutter/material.dart';

class Chatpage extends StatefulWidget {
  String name;
  Chatpage({Key? key, required this.name}) : super(key: key);

  @override
  _ChatpageState createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('name'),
      ),

    );
  }
}
