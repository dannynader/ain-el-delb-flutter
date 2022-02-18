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
  late List<String> urls = [];
  late List<String> imageUrl = [];
  List imagesWidget = [];
  List<String> listOfUrls = [
    "https://cosmosmagazine.com/wp-content/uploads/2020/02/191010_nature.jpg",
    "https://scx2.b-cdn.net/gfx/news/hires/2019/2-nature.jpg",
    "https://isha.sadhguru.org/blog/wp-content/uploads/2016/05/natures-temples.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/7/77/Big_Nature_%28155420955%29.jpeg",
    "https://s23574.pcdn.co/wp-content/uploads/Singular-1140x703.jpg",
    "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
    "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
    "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
    "https://www.expatica.com/app/uploads/sites/9/2017/06/Lake-Oeschinen-1200x675.jpg",
  ];
  getProjectImages() async {
    final response = await http.get(
        Uri.parse('https://api.aineldelb.gov.lb/api/projects-albumsV2/40'));
    final jsonData = jsonDecode(response.body) as List;

    jsonData.map((e) => imageUrl
        .add('https://api.aineldelb.gov.lb/storage/' + e['project']) as List);

    if (kDebugMode) {
      print(imageUrl);
    }

    setState(() {
      imagesWidget = jsonData;
      urls = imageUrl;
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
        body: urls.isEmpty
            ? SingleChildScrollView(
                child: GalleryImage(titleGallery: 'hi', imageUrls: listOfUrls))
            : const Text('data'));
  }
}