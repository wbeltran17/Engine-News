import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engine_news/pages/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value){
  runApp(const miApp());
});
}

//Create missing override
class miApp extends StatelessWidget {
  const miApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Engine News', 
      home: Login(),
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
    //llamado del método
    getUsers();
  } 

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
    // TODO: implement build
    throw UnimplementedError();
  }
}
