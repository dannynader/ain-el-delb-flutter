// import 'package:aineldelb/Project/project.dart';
// import 'package:aineldelb/home/components/home.dart';
import 'package:aineldelb/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; 

void main() {
  runApp(
    const  MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates:  [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:  [
        Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
      ],
      home:  MyApp()
    )
    );
  // runApp(
  //   MaterialApp(
  //     title: 'Named Routes Demo',
  //     // Start the app with the "/" named route. In this case, the app starts
  //     // on the FirstScreen widget.
  //     initialRoute: '/',
  //     routes: {
  //       // When navigating to the "/" route, build the FirstScreen widget.
  //       '/': (context) =>  Home(),
  //       // When navigating to the "/second" route, build the SecondScreen widget.
  //       '/second': (context) => const Project(),
  //     },
  //   ),
  // );
}