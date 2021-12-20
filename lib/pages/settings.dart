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
  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ajustes',
      home: Scaffold(
        backgroundColor:
            currentTheme.isDarkTheme() ? Colors.white : Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Ajustes',
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Text("Tema:"
              ,
                  style: TextStyle(
                    color: currentTheme.isDarkTheme()
                        ? Colors.white
                        : Colors.black,)),
              Icon(Icons.wb_sunny,
                  color:
                      currentTheme.isDarkTheme() ? Colors.white : Colors.black),
              Switch(
                  value: currentTheme.isDarkTheme(),
                  onChanged: (value) {
                    String newTheme =
                        value ? ThemePreference.DARK : ThemePreference.LIGHT;
                    currentTheme.setTheme = newTheme;
                  }),
              Icon(Icons.brightness_2,
                  color:
                      currentTheme.isDarkTheme() ? Colors.white : Colors.black)
            ],
          ),
        ),
      ),
    );
  }

}
