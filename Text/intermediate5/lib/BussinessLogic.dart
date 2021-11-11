import "dart:math" as math;
import "dart:async";

class Generator {
  var rand;
  var intStream;
  init(StreamController<int> stream) {
    rand = new math.Random();
    intStream = stream;
  }

  // ランダムな整数を作る
  generate() {
    var data = rand.nextInt(100);
    print("generatorが$dataを作ったよ");
    intStream.sink.add(data);
  }
}

class Coordinator {
  var intStream;
  var strStream;
  init(StreamController<int> intStream,
      StreamController<String> strStream) {
    this.intStream = intStream;
    this.strStream = strStream;
  }

  // 流れてきたものをintからStringにする
  coorinate() {
    intStream.stream.listen((data) async {
      String newData = data.toString();
      print("coordinatorが$dataから$newDataに変換したよ");
      strStream.sink.add(newData);
    });
  }
}

class Consumer {
  var strStream;
  init(StreamController<String> stream) {
    strStream = stream;
  }

  // 流れてきたStringを表示する
  consume() {
    strStream.stream.listen((data) async {
      print("consumerが$dataを使ったよ");
    });
  }
}

class Generator2 {
  var rand;
  var intStream;
  init(StreamController<int> stream) {
    intStream = stream;
  }

  // ランダムな整数を作る
  generator() {
    var data = 3;
    print("generatorが$dataを作ったよ");
    intStream.sink.add(data);
  }


}


class AddListen{
  var newStream;
  var rand;

  init(StreamController<int> stream) {
    newStream = stream;
    rand = new math.Random();
  }

  generator() {
    var data = rand.nextInt(1000);
    print("generatorが$dataを作ったよ");
    newStream.sink.add(data);
  }

  consume() {
    newStream.stream.listen((data) async {
      print("consumerが$dataを使ったよ");
    });
  }




}