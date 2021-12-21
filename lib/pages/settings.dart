import 'package:engine_news/controllers/servicios.dart';
import 'package:engine_news/models/theme_preferences.dart';
import 'package:engine_news/providers/theme.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Service service = Service();
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ajustes',
      home: Scaffold(
        backgroundColor:
            currentTheme.isDarkTheme() ? Color(0xFF212121) : Colors.white,
        appBar: AppBar(
          backgroundColor:
          currentTheme.isDarkTheme() ? Color(0xFF303030) : Colors.white,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ajustes',
                  style: TextStyle(
                    color: currentTheme.getOppositeTheme(),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Tema: ",
                      style: TextStyle(
                        fontSize: 30,
                        color: currentTheme.getOppositeTheme(),
                      )),
                  Icon(Icons.wb_sunny,
                      color: currentTheme.getOppositeTheme()),
                  Switch(
                      value: currentTheme.isDarkTheme(),
                      onChanged: (value) {
                        String newTheme = value
                            ? ThemePreference.DARK
                            : ThemePreference.LIGHT;
                        currentTheme.setTheme = newTheme;
                      }),
                  Icon(Icons.brightness_2,
                      color: currentTheme.getOppositeTheme())
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size(350, 40),
                        padding: EdgeInsets.symmetric(horizontal: 80),
                        backgroundColor: Colors.redAccent,
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {
                        service.signOut(context);
                      },
                      child: Text('Cerrar Sesion'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
