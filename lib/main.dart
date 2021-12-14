import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engine_news/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
  runApp(const myApp());
});
}

//Create missing override
class myApp extends StatelessWidget {
  const myApp({Key? key}) : super(key: key);

void getUsers() async{
  CollectionReference coleccion=FirebaseFirestore.instance.collection('users');
  QuerySnapshot users=await coleccion.get();
  if (users.docs.length!=0){
    for (var doc in users.docs) {
      print(doc.data());
    }
  }
}

  @override
  Widget build(BuildContext context) {
    getUsers();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Engine News', 
      home: Login(),
    );
  }
}


