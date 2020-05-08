import 'package:flutter/material.dart';
import 'package:lockdowncountdown/country_selector.dart';
import 'package:lockdowncountdown/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var mapp;
  print("Initializing.");
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String value = _prefs.getString("countryName");
  if (value == null || value.length == 0) {
    mapp = MaterialApp(
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/countrySelector': (BuildContext context) => CountrySelector()
      },
      debugShowCheckedModeBanner: false,
      title: 'AppName',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: CountrySelector(),
    );
  } else {
    mapp = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppName',
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/countrySelector': (BuildContext context) => CountrySelector()
      },
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: HomePage(),
    );
  }
  print("Done.");
  runApp(mapp);
}
