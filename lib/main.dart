import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

void main() => runApp(MaterialApp(
  home: MyApp(),
  debugShowCheckedModeBanner: false,
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
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25)
    ),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  Color selectedColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'tickets'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'calendar'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'microphone')
          ],
        )
    );
  }
}
