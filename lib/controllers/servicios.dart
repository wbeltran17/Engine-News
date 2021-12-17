import 'package:engine_news/main.dart';
import 'package:engine_news/pages/inicio.dart';
import 'package:engine_news/pages/login.dart';
import 'package:engine_news/pages/resetPassword.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service {
  final auth = FirebaseAuth.instance;
  //Función Crear Usuario
  void CreateUser(context, email, password) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {Get.to(() => Login())});
    } catch (e) {
      errorbox(context, e);
    }
  }

//mensaje de error
  void errorbox(context, e) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(e.toString()),
          );
        });
  }

  //login
  void Login_User(context, email, password) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                prefs.setBool('sesion_ok', true),
                Get.to(() => Inicio())
              });
    } catch (e) {
      print(e);
      errorbox(context, "Error en datos de acceso");
    }
  }

  void sessionExits() async {
    final prefs = await SharedPreferences.getInstance();

    final sessionOk = prefs.getBool('sesion_ok') ?? false;
    if (sessionOk) {
      Get.to(() => Inicio());
    } else {
      Get.to(() => Login());
    }
  }

  //reset
  void resetPassword(
    context,
    email,
  ) async {
    try {
      await auth
          .sendPasswordResetEmail(email: email)
          .then((value) => {Get.to(() => Login())});
    } catch (e) {
      errorbox(context, e);
    }
  }

}

class Logout{
  final auth= FirebaseAuth.instance;
//signout
  void signOut(context) async {
  try{
    await auth.signOut();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('sesion_ok') ;
    Get.to(()=>Login());

  }
  catch (e){
    errorbox(context,e);
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
}
