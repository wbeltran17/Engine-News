import 'package:engine_news/main.dart';
import 'package:engine_news/pages/inicio.dart';
import 'package:engine_news/pages/resetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Service{
  final auth= FirebaseAuth.instance;
  //Función Crear Usuario
  void CreateUser(context, email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => 
      {
        Get.to(()=>Inicio())
      });
      
    } catch (e) {
      errorbox(context, e);
    }
  }

//mensaje de error
void errorbox(context, e){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Text('Error'),
      content: Text(e.toString()),
    );
  });
}

  //login
  void Login(context, email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) => 
      {
        Get.to(()=>Inicio())
      });
      
    } catch (e) {
      errorbox(context, e);
    }
  }

  //reset
    void resetPassword(context, email,) async {
    try {
      await auth.sendPasswordResetEmail(email: email).then((value) => 
      {
        Get.to(()=>Inicio())
      });
      
    } catch (e) {
      errorbox(context, e);
    }
  }


}