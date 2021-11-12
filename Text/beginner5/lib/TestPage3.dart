import 'package:flutter/material.dart';
import 'package:beginner5/TestPage4.dart';

class TestPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Test3"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TestPage4();
                }));
              },
              icon: Icon(Icons.favorite),
            ),
          ],
        ),
        body: Center(
            child: TextButton(
                onPressed: () => {Navigator.of(context).pop()},
                child: Text("戻る", style: TextStyle(fontSize: 80)))));
  }
}