import 'package:engine_news/pages/login.dart';
import 'package:engine_news/providers/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(const myApp());
  });
}

//Create missing override
class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  ThemeProvider themeChangeProvider = new ThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setTheme =
        await themeChangeProvider.themePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    //getUsers();
    return ChangeNotifierProvider.value(
      value: themeChangeProvider,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Engine News',
        home: Login(),
      ),
    );
  }
}
