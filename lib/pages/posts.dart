import 'package:flutter/material.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Feed de Posts',
      home: Scaffold(
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
                  padding: const EdgeInsets.all(4.0), child: Text('Feed de Posts', style: TextStyle(color: Colors.black)
                  ), 
                  ), 
            ],
          ),
  ),
        body: Center(
          child: Container(
            child: Text('Feed de Posts'),
          ),
        ),
      ),
    );
  }

  //toJson() {}
}
