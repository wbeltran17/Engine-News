import 'package:engine_news/pages/ListaMensajes.dart';
import 'package:engine_news/pages/activities.dart';
import 'package:engine_news/pages/posts.dart';
import 'package:engine_news/pages/publish.dart';
import 'package:engine_news/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        final currentTheme = Provider.of<ThemeProvider>(context);

    return (Scaffold(
      body:_paginas[_paginaActual], 
      bottomNavigationBar: BottomNavigationBar(
        onTap: (position) {
          setState(() {
            _paginaActual = position;
          });
        },
        backgroundColor:
            currentTheme.isDarkTheme() ? Color(0xff2a293d) : Colors.white,
        currentIndex: _paginaActual,
        //backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor:
            currentTheme.isDarkTheme() ? Colors.white : Colors.black,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.local_activity_outlined), label: "Actividades"),
          BottomNavigationBarItem(icon: Icon(Icons.content_copy_outlined), label: "Posts"),
          BottomNavigationBarItem(icon: Icon(Icons.publish_outlined), label: "Publicar"),
        ],
      ),
    ));
  }
}