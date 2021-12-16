//import 'dart:js';
import 'package:engine_news/controllers/servicios.dart';
import 'package:engine_news/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Registro extends StatelessWidget{
  const Registro({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: cuerpo(context),        
        );
  }
}

Widget cuerpo(BuildContext context){
    TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  Service service=Service();

  return ListView(
    children: [
  Container(
      //decoration: BoxDecoration(image :DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1507581332893-aefc5acf08e0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fG5ld3N8ZW58MHwxfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
      //fit: BoxFit.cover
      //),
      //),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            SizedBox(height: 10.0),
            nombre(),
            SizedBox(height: 25.0),
            //Text("Nombre", style: TextStyle(color: Colors.black, fontSize: 15.0),),
            //SizedBox(height: 5.0),
            //name(),
            SizedBox(height: 10.0),
            Text("Email de Registro", style: TextStyle(color: Colors.black, fontSize: 15.0),),
            SizedBox(height: 5.0),

            Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 3.0),
                child: TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su Email',
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                ),
                 SizedBox(height: 15.0),
              Text("Contraseña", style: TextStyle(color: Colors.black, fontSize: 15.0),),
                //TextField Password
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 3.0),
                child: TextField(
                  controller: passwordcontroller,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Ingrese su Password',
                    fillColor: Colors.white,
                    filled: true,

                  ),
                ),
                ),

                //botón registrar
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    style: TextButton.styleFrom( 
                      minimumSize: Size(150, 40),
                      padding: EdgeInsets.symmetric(horizontal: 80), backgroundColor: Colors.indigoAccent, shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(5.0), 
                    ),
                    ),
                    onPressed: (){
                      //Método registrar con usuario,
                        if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
                        service.CreateUser(context, emailcontroller.text, passwordcontroller.text);
                      }
                      else{
                        service.errorbox(context, 'Los campos no pueden estar vacíos');
                      }
                    },
                    child: Text('Registrarme', style: TextStyle(color: Colors.white),),
                  ),
                ),
                  TextButton(
                  onPressed: (){
                    //Llevar a página de registro
                    Get.to(()=>Login());
                  }, 
                  child: Text('Tengo una cuenta')
                  ),


            //usuario(context),
            //SizedBox(height: 10.0),
            //Text("Contraseña", style: TextStyle(color: Colors.black, fontSize: 15.0),),
            //SizedBox(height: 5.0),
            //contrasena(),
            //SizedBox(height: 30.0),
            //boton_enviar(context),
            //SizedBox(height: 15.0),
            //iniciar_sesion(),
            //SizedBox(height: 15.0),
            //boton_login(context),
            ],
            ),
      ),
      ),
    ],
  );
}

Widget title() {
  return Text(
    "Engine News",
    style: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget subtitle() {
  return Text(
    "La red social para redactores de noticias.",
    style: TextStyle(color: Colors.white, fontSize: 15.0),
  );
}

Widget logo() {
  return Container(
    child: Image.network(
        'https://image.flaticon.com/icons/png/512/1253/1253826.png',
        height: 70),
  );
}


Widget nombre(){
  return Text(
      "Registrarse",
      style: TextStyle(color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
  );
}

Widget name(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 3.0),
    child: TextField(
      decoration: InputDecoration(
          hintText: "Digite su nombre",
          fillColor: Colors.white,
          filled: true,
          //border: BorderRadius.circular(50.0),
      ),
      ),
  );
}

//Widget usuario(context){
//  TextEditingController emailcontroller=TextEditingController();
//  TextEditingController passwordcontroller=TextEditingController();
//  Service service=Service();
//
//return Container(
//    child: Padding(
//    padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 3.0),
//    child: TextField(
//    controller: emailcontroller,
//      decoration: InputDecoration(
//          hintText: "Digite el email",
//          fillColor: Colors.white,
//          filled: true,
//          //border: BorderRadius.circular(50.0),
//      ),
//      ),
//   ),);
//}

//Widget contrasena(){
//  TextEditingController passwordcontroller=TextEditingController();
//  return Container(
//    padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 3.0),
//    child: TextField(
//      obscureText: true, //Cambiar el texto a modo pass
//      decoration: InputDecoration(
//          hintText: "Digite el password",
//          fillColor: Colors.white,
//          filled: true,
//          //border: BorderRadius.circular(50.0),
//      ),
//      ),
//  );
//}

//Widget boton_enviar(context){
//  TextEditingController emailcontroller=TextEditingController();
//  TextEditingController passwordcontroller=TextEditingController();
//  Service service=Service();
//    return MaterialButton(
//        minWidth: 200.0,
//        height: 55.0,
//        onPressed: () {
//        if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
//        service.CreateUser(context, emailcontroller.text, passwordcontroller.text);
//        }
//        else{
//        service.errorbox(context, 'Los campos no pueden estar vacíos');
//        }
//  },
//        color: Colors.indigoAccent, shape: new RoundedRectangleBorder(
//      borderRadius: new BorderRadius.circular(5.0),
//      ),
//        child: Text("Registrarme", style: TextStyle(color: Colors.white),),
//    );
//}


Widget iniciar_sesion(){
  return Container(
    child: Text(
      "¿Tienes una cuenta? Inicia sesión 👇👇",
      style: TextStyle(color: Colors.black, fontSize: 15.0, fontWeight: FontWeight.bold),
  ),
  );
}

Widget boton_login(context) {
  return MaterialButton(
    padding: EdgeInsets.only(right: 10.0),
    minWidth: 200.0, 
    height: 40.0,
    onPressed: () {
      Get.to(()=>Login());
  },    color: Colors.indigoAccent, shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(5.0),
    ),
    child: Text(
      "Login",
      style: TextStyle(color: Colors.white), 
    ),
  );
}





