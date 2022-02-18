import 'package:aineldelb/component/NavBar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

class ProjectImage extends StatefulWidget {
  const ProjectImage({Key? key}) : super(key: key);

  @override
  _ProjectImageState createState() => _ProjectImageState();
}

class _ProjectImageState extends State<ProjectImage> {
  List<String> posts = [];
  List<String> temPosts = [];
  late List<dynamic> jsonData;
  int index = 0;
  Future<List> getProjectImages() async {
    final http.Response response = await http.get(
        Uri.parse('https://api.aineldelb.gov.lb/api/projects-albumsV2/40'));
    jsonData = jsonDecode(response.body);
    makeList();
    return jsonData;
  }

  makeList() {
    for (index = 0; index < jsonData.length; index++) {
      if (kDebugMode) {
        print(jsonData[index]['project']);
      }
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
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(103, 0, 103, 1),
          title: const Text("مشاريع"),
        ),
        body: posts.isNotEmpty
            ? SingleChildScrollView(
                child: GalleryImage(titleGallery: 'hi', imageUrls: posts))
            : const Text('data'));
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
