import 'package:engine_news/pages/Inicio.dart';
import 'package:engine_news/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Activities extends StatelessWidget {
  const Activities({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed de Actividades',
      home: Scaffold(

    appBar: AppBar(
    backgroundColor: Colors.transparent, elevation: 0.0,
    title: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      
    Image.network('https://image.flaticon.com/icons/png/512/1253/1253826.png',
                  fit: BoxFit.contain,
                  height: 32,
              ),
              Container(
                  padding: const EdgeInsets.all(8.0), child: Text('Feed de Actividades', style: TextStyle(color: Colors.black)
                  ), 
                  ), 
            ],
          ),
  ),

        body: Center(
          child: Container(
            child: Text('Feed de Actividades'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          backgroundColor: Colors.blue,
          onPressed: (){
            Get.to(()=>Login());
          }
        ,),
      ),
    );
  }
}
