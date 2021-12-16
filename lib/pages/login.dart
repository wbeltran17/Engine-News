import 'package:engine_news/controllers/servicios.dart';
import 'package:engine_news/pages/inicio.dart';
import 'package:engine_news/pages/registro.dart';
import 'package:engine_news/pages/resetPassword.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Create missing override
class Login extends StatelessWidget {


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      body: cuerpo(context),        
        );
  }
}

Widget cuerpo(BuildContext context) {
   TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  Service service= Service();


  
  return ListView(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1507581332893-aefc5acf08e0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fG5ld3N8ZW58MHwxfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              title(),
              logo(),
              subtitle(),
              SizedBox(height: 20.0),
              nombre(),
              SizedBox(height: 20.0),
              Text("Correo", style: TextStyle(color: Colors.white, fontSize: 15.0),),

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
                SizedBox(height: 10.0),
              Text("Contraseña", style: TextStyle(color: Colors.white, fontSize: 15.0),),
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


                //botón login
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
                      //Método Login con usuario, aquí ya debe tener credenciales
                      if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
                        service.Login(context, emailcontroller.text, passwordcontroller.text);
                      }
                      else{
                        service.errorbox(context, 'Los campos no pueden estar vacíos');
                      }
                    },
                    child: Text('Login'),
                  ),
                ),

                //////TextButton --- no tiene una cuenta?
                TextButton(
                  onPressed: (){
                    Get.to(()=>Registro());
                   
                    //Llevar a página de registro
                  }, 
                  
                  child: Text('¿No tiene cuenta? Regístrate aquí', style: TextStyle(color: Colors.white),)
                  ),
                  //////TextButton --- Olvidé mi contraseña?
                  TextButton(
                  onPressed: (){
                     Get.to(()=>ResetPassword());
                    //Llevar a página de Reset Password
                  }, 
                  child: Text('Olvidé mi contraseña', style: TextStyle(color: Colors.white),)
                  ),



              //usuario(),
              //SizedBox(height: 5.0),
              //Text("Contraseña", style: TextStyle(color: Colors.white, fontSize: 15.0), textAlign: TextAlign.right,),
              //contrasena(),
              //SizedBox(height: 20.0),
              //boton_enviar(context),
              //SizedBox(height: 10.0),
              //registrar(),
              SizedBox(height: 10.0),
              botonesSM(),
              SizedBox(height: 15.0),
              //Text("¿Olvidaste tu contraseña?", style: TextStyle(color: Colors.white, fontSize: 15.0), textAlign: TextAlign.left,),
              //SizedBox(height: 15.0),
              //boton_registrar(context)
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

Widget nombre() {
  return Text(
    "Iniciar Sesión",
    style: TextStyle(
        color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold), textAlign: TextAlign.start,
  );
}

Widget usuario() {
    TextEditingController emailcontroller=TextEditingController();
  return Container( 
    padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 3.0),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Digite el usuario",
        fillColor: Colors.white,
        filled: true,
        //border: BorderRadius.circular(50.0),
      ),
    ),
    
  );
}

Widget contrasena() {
    TextEditingController passwordcontroller=TextEditingController();
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 3.0),
    child: TextField(
      obscureText: true, //Cambiar el texto a modo pass
      decoration: InputDecoration(
        hintText: "Digite el password",
        fillColor: Colors.white,
        filled: true,
        //border: BorderRadius.circular(50.0),
      ),
    ),
  );
}

Widget boton_enviar(context) {
  TextEditingController emailcontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();
  Service service= Service();
  return MaterialButton(
    padding: EdgeInsets.symmetric(horizontal: 65.0, vertical: 3.0),
    minWidth: 210.0, 
    height: 55.0,
    onPressed: () {
      if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
          service.Login(context, emailcontroller.text, passwordcontroller.text);
          }
          else{
          service.errorbox(context, 'Los campos no pueden estar vacíos');
          }
  },
    //onPressed: () => Inicio(), //print('Iniciar sesión'),
    color: Colors.indigoAccent, shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(5.0),
    ),
    child: Text(
      "Iniciar sesión",
      style: TextStyle(color: Colors.white), 
    ),
  );
}

Widget registrar() {
  return Container(
    child: Text(
      "O",
      style: TextStyle(
          color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget botonesSM() {
  return 
  Row( 
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        child: MaterialButton(
    //padding: EdgeInsets.symmetric(horizontal: 110.0, vertical: 3.0), 
    minWidth: 100.0, 
    height: 55.0,
    onPressed: () {
            Get.to(()=>Inicio());
        },
    color: Colors.red[400], shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
    ),
    child: Text(
        "Gmail",
        style: TextStyle(color: Colors.white), 
    ),
    ),
      ),

    Container(
      margin: EdgeInsets.only(right: 20.0),
      child: MaterialButton(
      //padding: EdgeInsets.symmetric(horizontal: 110.0, vertical: 3.0),
      minWidth: 100.0, 
      height: 55.0,
      onPressed: () {
            Get.to(()=>Inicio());
        },
      color: Colors.indigo[900], shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(5.0),
      ),
      child: Text(
        "Facebook",
        style: TextStyle(color: Colors.white), 
      ),
      ),
    )
    ],
    );
}

Widget boton_registrar(context) {
  return Container(
    margin: EdgeInsets.only(right: 40),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          padding: EdgeInsets.only(right: 10.0),
          minWidth: 100.0, 
          height: 35.0,
          onPressed: () {
            Get.to(()=>Registro());
        },    color: Colors.transparent, shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
          child: Text(
            "Registrarse",
            style: TextStyle(color: Colors.white), 
          ),
        ),
      ],
    ),
  );
}

