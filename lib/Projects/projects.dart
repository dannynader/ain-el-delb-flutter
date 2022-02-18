import 'package:aineldelb/Projects/project/project.dart';
import 'package:aineldelb/component/NavBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);
  @override
  _State createState() => _State();
}

class _State extends State<Projects> {
  List projects = [];
  getProjects() async {
    final response =
        await http.get(Uri.parse('https://api.aineldelb.gov.lb/api/projects'));
    final jsonData = jsonDecode(response.body) as List;
    setState(() {
      projects = jsonData;
    });
  }

  @override
  void initState() {
    super.initState();
    getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(103, 0, 103, 1),
          title: const Text("مشاريع"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: projects
                .map(
                  (item) => Column(
                    children: [
                      SizedBox(
                        child: Card(
                          child: Column(children: [
                            ListTile(
                              isThreeLine: true,
                              title: Text(item['title'],
                                  textAlign: TextAlign.center),
                              subtitle: Image.network(
                                  "http://api.aineldelb.gov.lb/storage/" +
                                      item["image"]),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                // Within the `FirstScreen` widget
                                onPressed: () {
                                  // Navigate to the second screen using a named route.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>  Project(projectData: item,)),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    primary:
                                        const Color.fromRGBO(103, 0, 103, 1)),

                                child: const Text('مزيد من التفاصيل '),
                              ),
                            )
                          ]),
                          elevation: 8,
                          shadowColor: Colors.black,
                        ),
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        ));
  }
}
