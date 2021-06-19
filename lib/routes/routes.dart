import 'package:flutter/widgets.dart';
import 'package:weather_app/screens/first_screen.dart';
import '../main.dart';

//import 'package:newfile/screens/second_screen.dart';
Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => MyHomePage(),
  '/First_screen': (BuildContext context) => FirstScreen(),
  //'/Second_screen':(BuildContext context) => SecondScreen(),
};
