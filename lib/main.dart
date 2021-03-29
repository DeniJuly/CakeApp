import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:magandhy_cake/pages/favorite.dart';
import 'package:magandhy_cake/pages/home.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Quicksand'),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedItemPosition = 0;
  SnakeShape snakeShape = SnakeShape.circle;
  EdgeInsets padding = const EdgeInsets.all(12);
  ShapeBorder bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(25), topRight: Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  Color selectedColor = Colors.black;
  List _PageView = [
    Home(),
    Text('Hallo 2'),
    Favorite(),
    Text('Hallo 4'),
  ];

  onPageChange(val) {
    this.setState(() {
      _selectedItemPosition = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: _PageView[_selectedItemPosition],
        ),
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: snakeBarStyle,
          snakeShape: snakeShape,
          shape: bottomBarShape,

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: Color(0xffFFF8E9),
          selectedItemColor: Color(0xffFDB827),
          unselectedItemColor: Colors.blueGrey,
          elevation: 4,

          showUnselectedLabels: false,
          showSelectedLabels: false,

          currentIndex: _selectedItemPosition,
          onTap: (index) => setState(() => _selectedItemPosition = index),
          items: [
            BottomNavigationBarItem(
                icon: _selectedItemPosition == 0
                    ? new SvgPicture.asset('assets/icons/home-active.svg')
                    : new SvgPicture.asset('assets/icons/home.svg'),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: _selectedItemPosition == 1
                    ? new SvgPicture.asset('assets/icons/shop-active.svg')
                    : new SvgPicture.asset('assets/icons/shop.svg'),
                label: 'Shop'),
            BottomNavigationBarItem(
                icon: _selectedItemPosition == 2
                    ? new SvgPicture.asset('assets/icons/love-active.svg')
                    : new SvgPicture.asset('assets/icons/love.svg'),
                label: 'Shop'),
            BottomNavigationBarItem(
                icon: _selectedItemPosition == 3
                    ? new SvgPicture.asset('assets/icons/profile-active.svg')
                    : new SvgPicture.asset('assets/icons/profile.svg'),
                label: 'Shop'),
          ],
        ));
  }
}
