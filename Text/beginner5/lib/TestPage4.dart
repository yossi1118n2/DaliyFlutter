import 'package:flutter/material.dart';
import 'package:beginner5/TestPage5.dart';
import 'package:beginner5/TestPage6.dart';
import 'package:beginner5/TestPage7.dart';

class TestPage4 extends StatefulWidget{
  @override
  _TestPage4State createState() => _TestPage4State();
}

class _TestPage4State extends State<TestPage4>{
  PageController _pageController;
  int _selectedIndex = 0;

  // ボトムメニューの遷移先画面
  var _pages = [
    TestPage5(),
    TestPage6(),
    TestPage7(),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //return LoginPage();

    return Scaffold(
        body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pages));
  }

}