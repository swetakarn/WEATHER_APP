import 'package:flutter/material.dart';
import 'package:weather_app/config/config.dart';
import 'package:weather_app/services/api.dart';
import 'package:weather_app/models/weather_model.dart';
//import 'package:weather_app/routes/routes.dart';
import 'package:flutter/cupertino.dart';

class FirstScreen extends StatefulWidget {
  final Weather weather;
  final String name;
  final Wind wind;
  final int id;
  final Sys sys;
  final Main main;

  FirstScreen(
      {this.name, this.id, this.wind, this.main, this.sys, this.weather});
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen>
    with SingleTickerProviderStateMixin {
  bool loading = false;
  bool errorloading = false;
  Forecasting forecasting = Forecasting();
  @override
  void initState() {
    super.initState();
    print(widget.name);
    print(forecasting.main.toString());
    _getData();
  }

  _getData() async {
    try {
      print(config['http://api.openweathermap.org/data/2.5/weather?q='] +
          "${widget.name}" +
          config['fe71b1be3ff982af90b4a5d5569e7c99']);
      forecasting = Forecasting.fromJson(await Api.getRequest(
          config['http://api.openweathermap.org/data/2.5/weather?q='] +
              "${widget.name}" +
              config['fe71b1be3ff982af90b4a5d5569e7c99']));

      print(forecasting.weather[0].icon);
      print(forecasting.weather[0].main);
      print(forecasting.wind.speed);

      setState(() {
        loading = true;
      });
    } catch (e) {
      print("error => ${e.toString()}");
      setState(() {
        errorloading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(40.0)),
              Text(widget.name, style: TextStyle(fontSize: 30)),
              Text('citydata=' + forecasting.weather.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
