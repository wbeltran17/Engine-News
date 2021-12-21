import 'package:engine_news/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Publish extends StatelessWidget {
  const Publish({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Publicar',
      home: Scaffold(
        backgroundColor:
            currentTheme.isDarkTheme() ? Color(0xff2a293d) : Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.network(
                'https://image.flaticon.com/icons/png/512/1253/1253826.png',
                fit: BoxFit.contain,
                height: 32,
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Publicar Posts',
                  style: TextStyle(
                    color: currentTheme.getOppositeTheme(),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Center(
          child: Container(
            child: Text(
              'Espacio para Publicar Posts',
              style: TextStyle(
                color: currentTheme.getOppositeTheme(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
