import 'package:engine_news/pages/ListaMensajes.dart';
import 'package:engine_news/pages/activities.dart';
import 'package:engine_news/pages/publish.dart';
import 'package:engine_news/pages/settings.dart';
import 'package:engine_news/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'gps.dart';

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
  int _paginaActual = 0;
  List<Widget> _paginas = [
    Activities(), //0
    ListaMensajes(), //1
    Publish(), //2
    Settings(), //3
    Gps(),
  ];
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return (Scaffold(
      body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (position) {
          setState(() {
            _paginaActual = position;
          });
        },
        currentIndex: _paginaActual,
        selectedItemColor: Colors.blue,
        unselectedItemColor: currentTheme.getOppositeTheme(),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_activity_outlined),
              label: "Actividades",
              backgroundColor: currentTheme.getTheme()),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Chat",
              backgroundColor: currentTheme.getTheme()),
          BottomNavigationBarItem(
              icon: Icon(Icons.publish_outlined),
              label: "Publicar",
              backgroundColor: currentTheme.getTheme()),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Ajustes",
              backgroundColor: currentTheme.getTheme()),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_pin), label: "ubicacion"),
        ],
      ),
    ));
  }
}
