import 'package:engine_news/pages/login.dart';
import 'package:engine_news/pages/registro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//Create missing override
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Engine News',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _actualPage=0;
  List<Widget>_pages=[
    Login(),//0
    Registro(),//1
  ];
  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [Home(), Registro()];
    return (Scaffold(
      //appBar: AppBar(title: Text(
      //"Ejemplo 1 sesion 4"
      //),
      //),
       body: _pages[_actualPage],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (position) {
          setState(() {
            _actualPage = position;
          });
        },
        currentIndex: _actualPage,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.login), label: "Login"),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: "Registro"),
        ],
      ),
    ));
  }
  //debugShowCheckedModeBanner: false;
}
