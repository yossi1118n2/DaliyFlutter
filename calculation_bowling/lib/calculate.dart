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
  List<bool> _name_alert = [false,false,false,false,false];

  //  スコアをリセット
  void reset(){
    setState(() {
        //ここにリセット処理を記載
          for(int i=0; i <5; i++){
            _scratch[i] = 0;
          }
        }
      );
    }

  // HDCP(ハンディーキャップ)をリセット
  void resetHDCP(){
    setState(() {
      //ここにリセット処理を記載
      for(int i=0; i <5; i++){
        _hpcp[i] = 0;
      }
    }
    );
  }
  // 名前が被っていた場合にアラートを出す
   namealert(){
     int count = 0;

     setState(() {
       //初期化
       for(int j=0;j<5;j++){
         _name_alert[j] = false;
       }

       //外ループ(名前の数)
       for(int i=0;i<5;i++){
         //内ループ(入力リストの数)
         count = 0;
         for(int j=0;j<5;j++){
           //indexと配列の要素番号が2ずれいている(ひどいコード)
           print(_selectItem[j]);
           if(_selectItem[j] == (i + 2)){
             count++;
             if(count >= 2){
               print("inroop");
               _name_alert[j] = true;
               setItems();
             }
           }
         }
       }
     });
  }

  void add(){
    for(int i=0;i<5;i++){
      _sum[i] = _hpcp[i] + _scratch[i];
    }
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
        child: Text('---', style: TextStyle(fontSize: 20.0),),
        value: 1,
      ))
      ..add(DropdownMenuItem(
        child: Text('吉川', style: TextStyle(fontSize: 20.0,color:_name_alert[0] ? Colors.black : Colors.red),),
        value: 2,
      ))
      ..add(DropdownMenuItem(
        child: Text('せいげん', style: TextStyle(fontSize: 20.0,color:_name_alert[1] ? Colors.black : Colors.red),),
        value: 3,
      ))
      ..add(DropdownMenuItem(
        child: Text('永江', style: TextStyle(fontSize: 20.0,color:_name_alert[2] ? Colors.black : Colors.red),),
        value: 4,
      ))
      ..add(DropdownMenuItem(
        child: Text('沢木', style: TextStyle(fontSize: 20.0,color:_name_alert[3] ? Colors.black : Colors.red),),
        value: 5,
      ))
      ..add(DropdownMenuItem(
        child: Text('ゆうりん', style: TextStyle(fontSize: 20.0,color:_name_alert[4] ? Colors.black : Colors.red),),
        value: 6,
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
                  value: _selectItem[0],
                  onChanged: (value) => {
                    setState(() {
                      _selectItem[0] = value;
                      namealert();
                      add();
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
                  child: Text('${_sum[0]}', style: TextStyle(fontSize: 36),),
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
                          namealert();
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
                  value: _selectItem[2],
                  onChanged: (value) => {
                    setState(() {
                      namealert();
                      add();
                      _selectItem[2] = value;
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
                  child: Text('${_sum[2]}', style: TextStyle(fontSize: 36),),
                ),
                // サイズを指定

                //ここにint型のtextboxを追加
              ]
          ),
          Row(
              children: [
                DropdownButton(
                  items: _items,
                  value: _selectItem[3],
                  onChanged: (value) => {
                    setState(() {
                      namealert();
                      add();
                      _selectItem[3] = value;
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
                  child: Text('${_sum[3]}', style: TextStyle(fontSize: 36),),
                ),
                // サイズを指定

                //ここにint型のtextboxを追加
              ]
          ),
          Row(
              children: [
                DropdownButton(
                  items: _items,
                  value: _selectItem[4],
                  onChanged: (value) => {
                    setState(() {
                      namealert();
                      add();
                      _selectItem[4] = value;
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
                  child: Text('${_sum[4]}', style: TextStyle(fontSize: 36),),
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
              child:Container(color: Colors.white,  width: 150 , height: 75 , child: Text('調整リセット',style: TextStyle(fontSize: 25, color: Colors.green),),alignment:Alignment.center,),
            ),
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

