import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class Publish extends StatelessWidget {
  const Publish({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Publicar',
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
                  padding: const EdgeInsets.all(8.0), child: Text('Publicar Posts', style: TextStyle(color: Colors.black)
                  ), 
                  ), 
            ],
          ),
  ),
        body: Center(
          child: Container(
            child: Text('Espacio para Publicar Posts'),
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