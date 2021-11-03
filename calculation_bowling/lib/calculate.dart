import 'package:flutter/material.dart';


class Calculate extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("スコア計算機")
      ),
      body: CalculatePage()
    );
  }
}


class CalculatePage extends StatefulWidget{
  @override
  _CalculatePageState createState() => _CalculatePageState();
}


class _CalculatePageState extends State<CalculatePage>{
  List<DropdownMenuItem<int>> _items = [];
  List<int> _selectItem = [0,0,0,0,0];
  List<int> _scratch = [0,0,0,0,0];
  List<int> _hpcp = [0,0,0,0,0];
  List<int> _sum = [300,300,300,300,300];

  void reset(){
    setState(() {
        //ここにリセット処理を記載
        }
      );
    }


  @override
  void initState() {
    super.initState();
    setItems();
    for(int i=0;i<5;i++){
      _selectItem[i] = _items[0].value;
    }
  }

  void _pushdatabase() {
    //ここにデータベースに入れるためのコードを記載

  }

  void setItems() {
    _items
      ..add(DropdownMenuItem(
        child: Text('吉川', style: TextStyle(fontSize: 20.0),),
        value: 1,
      ))
      ..add(DropdownMenuItem(
        child: Text('せいげん', style: TextStyle(fontSize: 20.0),),
        value: 2,
      ))
      ..add(DropdownMenuItem(
        child: Text('永江', style: TextStyle(fontSize: 20.0),),
        value: 3,
      ))
      ..add(DropdownMenuItem(
        child: Text('沢木', style: TextStyle(fontSize: 20.0),),
        value: 4,
      ))
      ..add(DropdownMenuItem(
        child: Text('ゆうりん', style: TextStyle(fontSize: 20.0),),
        value: 5,
      ));
  }


   @override
   Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        mainAxisAlignment: (MainAxisAlignment.spaceEvenly),
        children: [
          Row(
              children: [
                DropdownButton(
                  items: _items,
                  value: _selectItem[1],
                  onChanged: (value) => {
                    setState(() {
                      _selectItem[1] = value;
                    }),
                  },
                ),
                //Rowが必要なスペースを認識できるようにするために記載
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        //外枠をつける
                        border: OutlineInputBorder(),
                        hintText: 'スクラッチ',
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        //外枠をつける
                        border: OutlineInputBorder(),
                        hintText: '調整',
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('${_sum[1]}', style: TextStyle(fontSize: 36),),
                ),
                // サイズを指定

                //ここにint型のtextboxを追加
              ]
          ),

          Row(
              children: [
                  DropdownButton(
                      items: _items,
                      value: _selectItem[1],
                      onChanged: (value) => {
                        setState(() {
                          _selectItem[1] = value;
                        }),
                      },
                    ),
                    //Rowが必要なスペースを認識できるようにするために記載
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          decoration: InputDecoration(
                            //外枠をつける
                            border: OutlineInputBorder(),
                            hintText: 'スクラッチ',
                          ),
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),

                    Flexible(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: TextField(
                          decoration: InputDecoration(
                            //外枠をつける
                            border: OutlineInputBorder(),
                            hintText: '調整',
                          ),
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('${_sum[1]}', style: TextStyle(fontSize: 36),),
                    ),
                    // サイズを指定

                //ここにint型のtextboxを追加
              ]
          ),
          Row(
              children: [
                DropdownButton(
                  items: _items,
                  value: _selectItem[1],
                  onChanged: (value) => {
                    setState(() {
                      _selectItem[1] = value;
                    }),
                  },
                ),
                //Rowが必要なスペースを認識できるようにするために記載
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        //外枠をつける
                        border: OutlineInputBorder(),
                        hintText: 'スクラッチ',
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        //外枠をつける
                        border: OutlineInputBorder(),
                        hintText: '調整',
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('${_sum[1]}', style: TextStyle(fontSize: 36),),
                ),
                // サイズを指定

                //ここにint型のtextboxを追加
              ]
          ),
          Row(
              children: [
                DropdownButton(
                  items: _items,
                  value: _selectItem[1],
                  onChanged: (value) => {
                    setState(() {
                      _selectItem[1] = value;
                    }),
                  },
                ),
                //Rowが必要なスペースを認識できるようにするために記載
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        //外枠をつける
                        border: OutlineInputBorder(),
                        hintText: 'スクラッチ',
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        //外枠をつける
                        border: OutlineInputBorder(),
                        hintText: '調整',
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('${_sum[1]}', style: TextStyle(fontSize: 36),),
                ),
                // サイズを指定

                //ここにint型のtextboxを追加
              ]
          ),
          Row(
              children: [
                DropdownButton(
                  items: _items,
                  value: _selectItem[1],
                  onChanged: (value) => {
                    setState(() {
                      _selectItem[1] = value;
                    }),
                  },
                ),
                //Rowが必要なスペースを認識できるようにするために記載
                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        //外枠をつける
                        border: OutlineInputBorder(),
                        hintText: 'スクラッチ',
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),

                Flexible(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      decoration: InputDecoration(
                        //外枠をつける
                        border: OutlineInputBorder(),
                        hintText: '調整',
                      ),
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text('${_sum[1]}', style: TextStyle(fontSize: 36),),
                ),
                // サイズを指定

                //ここにint型のtextboxを追加
              ]
          ),
           Center(
             child:GestureDetector(
             // behavior: HitTestBehavior.deferToChild,
             onTap: (){
              reset();
             },
             child:Container(color: Colors.white,  width: 150 , height: 75 , child: Text('リセット',style: TextStyle(fontSize: 30, color: Colors.green),),alignment:Alignment.center,),
             ),
           ),



        ],

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _pushdatabase,
        tooltip: 'データベースに保存',
        child: Container(
            color: Colors.red,
          child: Text('保存')
        ),
      ),
    );
  }
}

