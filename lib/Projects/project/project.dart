import 'package:aineldelb/Projects/projectImage/projectImage.dart';
import 'package:aineldelb/component/NavBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class Project extends StatelessWidget {
  final dynamic projectData;

  const Project({required this.projectData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic body1 = projectData['body'];
    dynamic body = body1 != null
        ? Html(data: projectData['body'])
        : Html(
            data: '<p></p>',
          );

    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
          backgroundColor: const Color.fromRGBO(103, 0, 103, 1),
          title: const Text("مشاريع"),
          actions: [
            IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ]),
      body: SingleChildScrollView(
          child: Column(
        children: [

          SizedBox(
            child: Card(
              child: Column(children: [
                ListTile(
                  isThreeLine: true,
                  title:
                      Text(projectData['title'], textAlign: TextAlign.center),
                  subtitle: Image.network(
                      "http://api.aineldelb.gov.lb/storage/" +
                          projectData["image"]),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  ProjectImage(projectID: projectData["id"])),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromRGBO(103, 0, 103, 1)),
                    child: const Text('للمزيد من الصور'),
                  ),
                ),
                // Text(projectData['id'].toString()),
                projectData['body'] == null ? const Text('') : body
              ]),
              elevation: 8,
              shadowColor: Colors.black,
            ),
          ),
        ],
      )),
    );
  }
}
