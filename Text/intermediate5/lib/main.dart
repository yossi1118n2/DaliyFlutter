import 'package:flutter/material.dart';
import 'package:intermediate5/BussinessLogic.dart';
import "dart:async";

//おそらくdartのバージョン更新が必要
//streamは2.10.4~しか使えない。
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  //利用するstereamは使うstate内で初期化する必要があるのかな?
  var intStream = StreamController<int>();
  //.broadcast()をつけることで複数のlistenerに対応できる。
  //つけない場合は1:1対応になる。
  var stringStream = StreamController<String>.broadcast();
  var generator = new Generator();
  var coodinator = new Coordinator();
  var consumer = new Consumer();
  var generator2 = new Generator2();

  var newStream = StreamController<int>();

  var addlisten = new AddListen();

  void _incrementCounter() {
    //generatorは何かをトリガーとして実行する。
    generator.generate();
    addlisten.generator();
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    //初期化が必要
    generator.init(intStream);
    coodinator.init(intStream, stringStream);
    consumer.init(stringStream);

    //新しいgenerator
    generator2.init(intStream);

    addlisten.init(newStream);

    coodinator.coorinate();
    consumer.consume();


    super.initState();
  }

  @override
  void dispose() {
    intStream.close();
    stringStream.close();
    newStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ),

            //画面に描画することができるlistener
            //snapshot.dataにデータが入ってるっぽいなぁー
            StreamBuilder<String>(
              stream: stringStream.stream,
              initialData: "",
              builder: (context, snapshot) {
                return Text(
                  'RANDOM-1(stringStreamlistenor) : ${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),


            StreamBuilder<int>(
              stream: newStream.stream,
              initialData: 0,
              builder: (context, snapshot) {
                return Text(
                  'RANDOM-2(newStreamlistenor) : ${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),

            ElevatedButton(
              child: const Text('Button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.black,
                shape: const StadiumBorder(),
              ),
              onPressed: () {
                generator2.generator();
              },
            ),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
