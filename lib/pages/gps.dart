import 'package:engine_news/providers/theme.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

class Gps extends StatefulWidget {
  @override
  State<Gps> createState() => _GpsState();
}

class _GpsState extends State<Gps> {
  Location location = new Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.granted;
  LocationData _locationData = LocationData.fromMap({});

  @override
  Widget build(BuildContext context) {
    final currentTheme = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        backgroundColor:
            currentTheme.isDarkTheme() ? Color(0xFF212121) : Colors.white,
        appBar: AppBar(
          backgroundColor:
              currentTheme.isDarkTheme() ? Color(0xFF303030) : Colors.white,
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
                padding: const EdgeInsets.all(4.0),
                child: Text('Mi ubicación',
                    style: TextStyle(
                      color: currentTheme.isDarkTheme()
                          ? Colors.white
                          : Colors.black,
                    )),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_on),
          onPressed: () {
            getLocation();
          },
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 100,
                child: Card(
                    color: currentTheme.isDarkTheme()
                        ? Color(0xFF303030)
                        : Colors.white,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text('Latitud',
                                style: TextStyle(
                                    color: currentTheme.isDarkTheme()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              '${_locationData.latitude}',
                              style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ))),
              ),
              Container(
                width: double.infinity,
                height: 100,
                child: Card(
                    color: currentTheme.isDarkTheme()
                        ? Color(0xFF303030)
                        : Colors.white,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text('Longitud',
                                style: TextStyle(
                                    color: currentTheme.isDarkTheme()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text(
                              '${_locationData.longitude}',
                              style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? Colors.white
                                      : Colors.black),
                            ),
                          ],
                        ))),
              ),
              Container(
                width: double.infinity,
                height: 100,
                child: Card(
                    color: currentTheme.isDarkTheme()
                        ? Color(0xFF303030)
                        : Colors.white,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text('Altitud',
                                style: TextStyle(
                                    color: currentTheme.isDarkTheme()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text('${_locationData.altitude}',
                                style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? Colors.white
                                      : Colors.black,
                                )),
                          ],
                        ))),
              ),
              Container(
                width: double.infinity,
                height: 100,
                child: Card(
                    color: currentTheme.isDarkTheme()
                        ? Color(0xFF303030)
                        : Colors.white,
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Text('Dirección',
                                style: TextStyle(
                                    color: currentTheme.isDarkTheme()
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                            Text('${_locationData.heading}',
                                style: TextStyle(
                                  color: currentTheme.isDarkTheme()
                                      ? Colors.white
                                      : Colors.black,
                                )),
                          ],
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    setState(() {});
  }
}
