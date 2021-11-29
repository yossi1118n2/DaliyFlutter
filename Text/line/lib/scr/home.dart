import 'package:flutter/material.dart';

import 'chat_page.dart';

class Home extends StatefulWidget{
  final String user_id;
  Home({Key? key, required this.user_id}) : super(key: key);
  @override
  HomeState createState() => HomeState();
}


// [Themelist] インスタンスにおける処理。
class HomeState extends State<Home> {


  List<String> titleList = ["general""raki", "rad", "kk"];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child:ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (BuildContext context, int index ){
            return Column(
              children: [
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(titleList[index]),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Chatpage(name:titleList[index],uid: widget.user_id)));
                  },
                ),
                Divider(),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            titleList.add('kentsu');
            print(titleList);
          });
        },
      ),
    );
  }
}