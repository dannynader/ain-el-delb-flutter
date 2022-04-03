// ignore_for_file: camel_case_types
import 'package:aineldelb/component/loader/loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_html/flutter_html.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:aineldelb/component/NavBar.dart';

class mokhtar extends StatefulWidget {
  const mokhtar({Key? key}) : super(key: key);

  @override
  State<mokhtar> createState() => _mokhtarState();
}

class _mokhtarState extends State<mokhtar> {
  dynamic mokhtar;


  bool empty = false;



  getMokhtar() async {
    final response = await http.get(
        Uri.parse('https://api.aineldelb.gov.lb/api/mukhtar'));
    final jsonData = jsonDecode(response.body);
    setState(() {
      mokhtar = jsonData;
      empty = true;
    });
  }



  @override
  void initState() {
    super.initState();
    getMokhtar();
  }

  @override
  Widget build(BuildContext context) {
    return !empty ? const Loader() : Scaffold(
            drawer: NavBar(),
            appBar: AppBar(
              title: const Text("المخاتير"),
              backgroundColor: const Color.fromRGBO(103, 0, 103, 1),
              actions: [
                IconButton(
                  icon: const Icon(Icons.arrow_forward, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            body: SingleChildScrollView(
                child: Card(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Text(
                    mokhtar['name'],
                    style: const TextStyle(fontSize: 40),
                  ),
                  Image.network("https://api.aineldelb.gov.lb/storage/${mokhtar['image']}"),
                  empty
                      ? Html(data: mokhtar['body'],
                      style: {
                        "div": Style(fontSize: const FontSize(20)),
                      }
                  )
                      : const Text('')
                ],
              ),
            )));
  }
}
