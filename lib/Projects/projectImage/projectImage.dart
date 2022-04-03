import 'package:aineldelb/component/NavBar.dart';
import 'package:aineldelb/component/loader/loader.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class ProjectImage extends StatefulWidget {
  final dynamic projectID;
  const ProjectImage({required this.projectID,Key? key}) : super(key: key);

  @override
  _ProjectImageState createState() => _ProjectImageState();
}

class _ProjectImageState extends State<ProjectImage> {
  List<String> posts = [];
  List<String> temPosts = [];
  late List<dynamic> jsonData = [];
  int index = 0;


  
  Future<List> getProjectImages() async {
    final http.Response response = await http.get(
        Uri.parse('https://api.aineldelb.gov.lb/api/projects-albumsV2/${widget.projectID}'));
    jsonData = jsonDecode(response.body);
    makeList();
    return jsonData;
  }

  makeList() {
    if (kDebugMode) {
      print('${widget.projectID}');
    }
    for (index = 0; index < jsonData.length; index++) {

      posts.add(jsonData[index]['project']);
    }
    setState(() {
      posts = posts;
    });
  }

  @override
  void initState() {
    getProjectImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return jsonData.isEmpty? const Loader(): Scaffold(
      resizeToAvoidBottomInset: false,
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
            children: List.generate(
                posts.length,
                (e) => GestureDetector(
                      // ignore: avoid_print
                      onTap: () => print(e),
                      child: Card(elevation: 8, child: Image.network(posts[e])),
                    ))),
      ),
    );
  }
}

class ProjectModel {
  final String project;
  ProjectModel({required this.project});
  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      project: json['project'],
    );
  }
}
