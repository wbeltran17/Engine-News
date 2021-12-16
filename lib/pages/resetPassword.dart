import 'package:engine_news/controllers/servicios.dart';
import 'package:engine_news/pages/login.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  TextEditingController emailcontroller=TextEditingController();
  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( 
        child: Container(
                  decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1507581332893-aefc5acf08e0?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzZ8fG5ld3N8ZW58MHwxfDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60"),
              fit: BoxFit.cover),
        ),

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
              title(),
              logo(),
              subtitle(),
              SizedBox(height: 20.0),

                Text('Reset Password', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),              SizedBox(height: 10.0),

                //TextField Email
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
                  ////////////botón reset
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
                        //Método reset
                          if (emailcontroller.text.isNotEmpty) {
                          service.resetPassword(context, emailcontroller.text);
                        }
                        else{
                          service.errorbox(context, 'Digite un email válido');
                        }
                      },
                      child: Text('Reset Password'),
                    ),
                  ),
              ],
            ),
            ),
        )
        ),
    );
  }
}