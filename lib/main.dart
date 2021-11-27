import 'package:engine_news/pages/login.dart';
import 'package:engine_news/pages/registro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(miApp());
}

//Create missing override
class miApp extends StatelessWidget {
  const miApp({Key? key}) : super(key: key);

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
  int _paginaActual=0;
  List<Widget>_paginas=[
    Login(),//0
    Registro(),//1
  ];
  @override
  Widget build(BuildContext context) {
        return (Scaffold(
      body:_paginas[_paginaActual], 
      bottomNavigationBar: BottomNavigationBar(
        onTap: (position) {
          setState(() {
            _paginaActual = position;
          });
        },
        currentIndex: _paginaActual,
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
}

