import 'dart:convert';

import 'package:aineldelb/component/NavBar.dart';
import 'package:aineldelb/component/loader/loader.dart';
import 'package:aineldelb/home/components/homecomponents.dart';
import 'package:aineldelb/home/components/sliderCarousel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List slider = [];

  getSlider() async {
    final response =
        await http.get(Uri.parse('https://api.aineldelb.gov.lb/api/slider-v2'));
    final jsonData = jsonDecode(response.body) as List;
    setState(() {
      slider = jsonData;
    });
  }

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print('jsonData');
    }
    getSlider();
  }

  @override
  Widget build(BuildContext context) {
    return slider.isEmpty? const Loader() : Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(103, 0, 103, 1),
          title: const Text("Home"),
        ),
        body:
        Column(children: [
          slider.isNotEmpty
              ? SlidersCarousel(
                  slidersData: slider,
                )
              : const CircularProgressIndicator(),
          ComponentHome()
        ])
        
        
        );
  }
}
