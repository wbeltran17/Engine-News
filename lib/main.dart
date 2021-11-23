import 'package:engine_news/registro.dart';
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
    miApp(),//0
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
      body: cuerpo(),  //Llamado al widget cuerpo()
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
  //debugShowCheckedModeBanner: false;
}

Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              "https://images.unsplash.com/photo-1507581332893-aefc5acf08e0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fG5ld3N8ZW58MHwxfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
          fit: BoxFit.cover),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          title(),
          subtitle(),
          SizedBox(height: 50.0),
          logo(),
          SizedBox(height: 40.0),
          nombre(),
          SizedBox(height: 40.0),
          usuario(),
          SizedBox(height: 10.0),
          contrasena(),
          SizedBox(height: 30.0),
          boton_enviar(),
          SizedBox(height: 15.0),
          registrar(),
        ],
      ),
    ),
  );
}

Widget title() {
  return Text(
    "Engine News",
    style: TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget subtitle() {
  return Text(
    "La red social para redactores de noticias.",
    style: TextStyle(color: Colors.white, fontSize: 20.0),
  );
}

Widget logo() {
  return Container(
    child: Image.network(
        'https://image.flaticon.com/icons/png/512/1253/1253826.png',
        height: 100),
  );
}

Widget nombre() {
  return Text(
    "Login",
    style: TextStyle(
        color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
  );
}

Widget usuario() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Digite el usuario",
        fillColor: Colors.white,
        filled: true,
        //border: BorderRadius.circular(50.0),
      ),
    ),
  );
}

Widget contrasena() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
    child: TextField(
      obscureText: true, //Cambiar el texto a modo pass
      decoration: InputDecoration(
        hintText: "Digite el password",
        fillColor: Colors.white,
        filled: true,
        //border: BorderRadius.circular(50.0),
      ),
    ),
  );
}

Widget boton_enviar() {
  return MaterialButton(
    minWidth: 200.0,
    height: 55.0,
    onPressed: () => print('Iniciar sesión'),
    color: Colors.lightBlue,
    child: Text(
      "Iniciar sesión",
      style: TextStyle(color: Colors.white),
    ),
  );
}

Widget registrar() {
  return Container(
    child: Text(
      "¿Eres nuevo usuario? Regístrate en la parte inferior 👇👇",
      style: TextStyle(
          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget registra(BuildContext context) {
  return Scaffold();
}

