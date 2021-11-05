import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
  List<int> _hdcp = [0,0,0,0,0];
  List<int> _sum = [300,300,300,300,300];
  List<bool> _name_alert = [false,false,false,false,false];

  var _controller_scratch0 = TextEditingController();
  var _controller_scratch1 = TextEditingController();
  var _controller_scratch2= TextEditingController();
  var _controller_scratch3 = TextEditingController();
  var _controller_scratch4 = TextEditingController();


  var _controller_hdcp0 = TextEditingController();
  var _controller_hdcp1 = TextEditingController();
  var _controller_hdcp2 = TextEditingController();
  var _controller_hdcp3 = TextEditingController();
  var _controller_hdcp4 = TextEditingController();




  //  スコアをリセット
  void reset(){
    setState(() {
        //ここにリセット処理を記載
          for(int i=0; i <5; i++){
            _scratch[i] = 0;
          }
          _controller_scratch0.clear();
          _controller_scratch1.clear();
          _controller_scratch2.clear();
          _controller_scratch3.clear();
          _controller_scratch4.clear();
        }
      );
      add();
    }

  // HDCP(ハンディーキャップ)をリセット
  void resetHDCP(){
    setState(() {
      //ここにリセット処理を記載
      for(int i=0; i <5; i++){
        _hdcp[i] = 0;
      }
      _controller_hdcp0.clear();
      _controller_hdcp1.clear();
      _controller_hdcp2.clear();
      _controller_hdcp3.clear();
      _controller_hdcp4.clear();
    }
    );
    add();
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
             }
           }
         }
       }
     });
  }

  void add(){
    for(int i=0;i<5;i++){
      setState(() {
        _sum[i] = _hdcp[i] + _scratch[i];
      });
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
        child: Text('吉川', style: TextStyle(fontSize: 20.0,color:Colors.black ),),
        value: 2,
      ))
      ..add(DropdownMenuItem(
        child: Text('せいげん', style:TextStyle(fontSize: 20.0,color:Colors.black ),),
        value: 3,
      ))
      ..add(DropdownMenuItem(
        child: Text('永江', style: TextStyle(fontSize: 20.0,color:Colors.black ),),
        value: 4,
      ))
      ..add(DropdownMenuItem(
        child: Text('沢木', style: TextStyle(fontSize: 20.0,color:Colors.black ),),
        value: 5,
      ))
      ..add(DropdownMenuItem(
        child: Text('ゆうりん', style: TextStyle(fontSize: 20.0,color:Colors.black ),),
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
                      controller: _controller_scratch0,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        setState(() {
                          _scratch[0] = int.parse(value);
                          add();
                        });
                      },
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
                      controller: _controller_hdcp0,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        setState(() {
                          _hdcp[0] = int.parse(value);
                          add();
                        });
                      },
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
                          controller: _controller_scratch1,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value){
                            setState(() {
                              _scratch[1] = int.parse(value);
                              add();
                            });
                          },
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
                          controller: _controller_hdcp1,
                          keyboardType: TextInputType.number,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          onChanged: (value){
                            setState(() {
                              _hdcp[1] = int.parse(value);
                              add();
                            });
                          },
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
                      controller: _controller_scratch2,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        setState(() {
                          _scratch[2] = int.parse(value);
                          add();
                        });
                      },
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
                      controller: _controller_hdcp2,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        setState(() {
                          _hdcp[2] = int.parse(value);
                          add();
                        });
                      },
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
                      controller: _controller_scratch3,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        setState(() {
                          _scratch[3] = int.parse(value);
                          add();
                        });
                      },
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
                      controller: _controller_hdcp3,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        setState(() {
                          _hdcp[3] = int.parse(value);
                          add();
                        });
                      },
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
                      controller: _controller_scratch4,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        setState(() {
                          _scratch[4] = int.parse(value);
                          add();
                        });
                      },
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
                      controller: _controller_hdcp4,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value){
                        setState(() {
                          _hdcp[4] = int.parse(value);
                          add();
                        });
                      },
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
                resetHDCP();
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

