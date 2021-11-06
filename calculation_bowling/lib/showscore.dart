import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculation_bowling/calculate.dart';

class Showscore extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
            title: Text("スコアを表示")
        ),
        body: Center(
          child: Text("ここに表示")
        )
    );
  }
}

