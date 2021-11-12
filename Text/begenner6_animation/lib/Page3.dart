import 'package:flutter/material.dart';


class Page3 extends StatefulWidget{
  @override
  _Page3State createState() => _Page3State();
}
//with TickerProviderStateMixin


class _Page3State extends State<Page3> with TickerProviderStateMixin{
  AnimationController _animationControler;

  _play() async {
    setState(() {
      _animationControler.forward();
    });
  }

  _stop() async {
    setState(() {
      _animationControler.stop();
    });
  }

  _reverse() async {
    setState(() {
      _animationControler.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationControler =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  void dispose() {
    _animationControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('もっと柔軟なアニメーション'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizeTransition(
              sizeFactor: _animationControler,
              child: Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(color: Colors.green))),
            ),
          ],
        ),
      ),
      floatingActionButton:
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
            onPressed: _play, child: Icon(Icons.arrow_forward)),
        FloatingActionButton(onPressed: _stop, child: Icon(Icons.pause)),
        FloatingActionButton(
            onPressed: _reverse, child: Icon(Icons.arrow_back)),
      ]),
    );
  }
}