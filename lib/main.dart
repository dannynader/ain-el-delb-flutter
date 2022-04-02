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
}