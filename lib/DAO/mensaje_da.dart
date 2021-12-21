import 'package:engine_news/models/mensaje.dart';
import 'package:firebase_database/firebase_database.dart';

class MensajeDA {
  final DatabaseReference _mensajeRef = FirebaseDatabase.instance.reference().child('mensajes');

  void guardarMensaje(Mensaje mensaje){
    _mensajeRef.push().set(mensaje.toJson());
  }

  Query getMensajes()=>_mensajeRef;
}