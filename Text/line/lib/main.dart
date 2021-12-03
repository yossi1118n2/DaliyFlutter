import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:line/login.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      home: Login(),
    );
  }
}
