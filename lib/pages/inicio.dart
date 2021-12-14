import 'package:engine_news/pages/ListaMensajes.dart';
import 'package:engine_news/pages/activities.dart';
import 'package:engine_news/pages/posts.dart';
import 'package:engine_news/pages/publish.dart';
import 'package:flutter/material.dart';

class miApp extends StatelessWidget {
  const miApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Engine News',
      //home: Home(),
    );
  }
}

class Inicio extends StatefulWidget {
  @override
  State<Inicio> createState() => _MyAppState();
}

class _MyAppState extends State<Inicio> {
  int _paginaActual=0;
  List<Widget>_paginas=[
    Activities(),//0
    ListaMensajes(),//1
    Publish(),//2
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
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.local_activity_outlined), label: "Actividades"),
          BottomNavigationBarItem(icon: Icon(Icons.content_copy_outlined), label: "Posts"),
          BottomNavigationBarItem(icon: Icon(Icons.publish_outlined), label: "Publicar"),
        ],
      ),
    ));
  }
}