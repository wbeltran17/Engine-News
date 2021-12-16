import 'package:engine_news/models/mensaje.dart';
import 'package:engine_news/models/mensaje_da.dart';
import 'package:engine_news/pages/Inicio.dart';
import 'package:engine_news/pages/login.dart';
import 'package:engine_news/pages/mensajewidget.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
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
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://image.flaticon.com/icons/png/512/1253/1253826.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text('Feed de Actividades',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
        body:Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _getActivities(),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          backgroundColor: Colors.blue,
          onPressed: () {
            Get.to(() => Login());
          },
        ),
      ),
    );
  }


  
  Widget _getActivities() {
    ScrollController _scrollController = ScrollController();
    
    WidgetsBinding.instance!.addPostFrameCallback((_) => (){if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }});
  final mensajeDA = MensajeDA();
    return Expanded(
        child: FirebaseAnimatedList(
      controller: ScrollController(),
      query: mensajeDA.getMensajes(),
      itemBuilder: (context, snapshot, animation, index) {
        final json = snapshot.value as Map<dynamic, dynamic>;
        final mensaje = Mensaje.fromJson(json);
        return MensajeWidget(mensaje.texto, mensaje.fecha);
      },
    ));
  }
}
