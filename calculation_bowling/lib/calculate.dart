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
        children: [
          Row(
            children: [
              DropdownButton(
                items: _items,
                value: _selectItem[0],
                onChanged: (value) => {
                  setState(() {
                    _selectItem[0] = value;
                  }),
                },
              ),

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

                //ここにint型のtextboxを追加
              ]
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pushdatabase,
        tooltip: 'データベースに保存',
        child: Container(color: Colors.red),
      ),
    );
  }
}

