import 'package:engine_news/pages/mensajewidget.dart';
import 'package:flutter/material.dart';
import '../../models/mensaje.dart';
import '../../models/mensaje_da.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';

class ListaMensajes extends StatefulWidget {
  final mensajeDA = MensajeDA();
  ListaMensajes({Key? key}) : super(key: key);

  @override
  _ListaMensajesState createState() => _ListaMensajesState();
}

class _ListaMensajesState extends State<ListaMensajes> {

  ScrollController _scrollController = ScrollController();
  TextEditingController _mensajeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_)=>_scrollHaciaAbajo());
    return Scaffold(
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
                  padding: const EdgeInsets.all(8.0), child: Text('Feed de Posts', style: TextStyle(color: Colors.black)
                  ), 
                  ), 
            ],
          ),
  ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _getListaMensajes(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
                Flexible(
                  child:Padding(
                    padding:EdgeInsets.symmetric(horizontal: 12.0) ,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      controller: _mensajeController,//Construir
                      onChanged: (text)=>setState(() {}),
                      onSubmitted: (input){
                        _enviarMensaje(); //Construir
                      },
                      decoration: InputDecoration(
                        hintText: 'Escribir un mensaje'
                      ),
                     ),
                    ) 
                    ),
                    IconButton(
                      icon: Icon(_puedoEnviarMensaje()? CupertinoIcons.arrow_right_circle_fill : CupertinoIcons.arrow_right_circle),
                      onPressed: () {
                        _enviarMensaje();
                      },
                    )
              ],

            )
          ],
        ),
        ),
    );
  }


  Widget _getListaMensajes(){
    return Expanded(
      child: FirebaseAnimatedList(
         controller: _scrollController,
         query: widget.mensajeDA.getMensajes(),
         itemBuilder: (context, snapshot, animation, index) {
           final json = snapshot.value as Map<dynamic, dynamic>;
           final mensaje=Mensaje.fromJson(json);
          return MensajeWidget(mensaje.texto, mensaje.fecha);
         },
         ));
  }

  void _scrollHaciaAbajo(){
    if (_scrollController.hasClients){
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  void _enviarMensaje() {
    if (_puedoEnviarMensaje()){
      final mensaje = Mensaje( _mensajeController.text, DateTime.now());
      widget.mensajeDA.guardarMensaje(mensaje);
      _mensajeController.clear();
      setState(() {});
    }
  }

  bool _puedoEnviarMensaje() => _mensajeController.text.length>0;

}