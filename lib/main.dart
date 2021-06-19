import 'package:flutter/material.dart';
import 'package:weather_app/screens/first_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("weather report"),
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              Colors.blue[400],
              Colors.blue[300],
              Colors.blue[200],
              Colors.blue[100],
            ],
          ),
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "write any country or city name",
                    icon: Icon(Icons.cloud),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              ElevatedButton(
                child: Center(
                  child: Text(
                    "FIND",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                style: ElevatedButton.styleFrom(primary: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              FirstScreen(name: controller.text)));
                  controller.clear();
                },
              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Center(
                child: Text("Weather report",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 40)),
              ),
              Padding(
                padding: EdgeInsets.all(50),
              ),
              Center(
                child: Text(
                    "Search about any location's weather conditions only at one click",
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontSize: 20)),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
