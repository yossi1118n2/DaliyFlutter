import 'package:flutter/material.dart';
import 'package:begenner6_animation/Page3.dart';


class Page2 extends StatefulWidget{
  @override
  _Page2State createState() => _Page2State();
}


class _Page2State extends State<Page2> {
  bool flag = false;
  //非同期でflagを変更する
  //これで同時にアニメーションが実行できる?
  _click() async {
    setState(() {
      flag = !flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('まとめて使う'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //要素をまとめて変更
            //main.dartに書いたやつは特定の要素しか変更できず汎用性が低い
            AnimatedContainer(
                //切り替える秒数
                duration: Duration(seconds: 3),
                width: flag ? 100 : 50,
                height: flag ? 50 : 100,
                padding: flag ? EdgeInsets.all(0) : EdgeInsets.all(30),
                margin: flag ? EdgeInsets.all(0) : EdgeInsets.all(30),
                transform: flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
                color: flag ? Colors.blue : Colors.grey),
            //2つのWidgetを切り替えるアニメーション
            AnimatedSwitcher(
                //切り替える秒数
                duration: Duration(seconds: 3),
                //flagで切り替えるのは変わらない。
                child: flag
                    ? Text("なにもない")
                    : Icon(Icons.favorite, color: Colors.pink)),

            ElevatedButton(
              child: const Text('Button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return Page3();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton:
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        FloatingActionButton(onPressed: _click, child: Icon(Icons.add)),
      ]),
    );
  }
}