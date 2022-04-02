import 'package:aineldelb/Projects/projects.dart';
import 'package:aineldelb/mokhtar/mokhtar.dart';
// import 'package:aineldelb/home/components/homeIcon.dart';
import 'package:flutter/material.dart';

class ComponentHome extends StatelessWidget {
  final List iconList = [
    {
      "img": "lib/assets/imgs/architect-with-building-project.png",
      "textIcon": "مشاريع",
      "nav": const Projects()
    },
    {"img": "lib/assets/imgs/man-user.png", "textIcon": "المخاتير",
    "nav": const mokhtar()},
    {
      "img": "lib/assets/imgs/public-museum-sign.png",
      "textIcon": "المجلس البلدي"
    },
    {"img": "lib/assets/imgs/newspaper.png", "textIcon": "في الإعلام"},
    {"img": "lib/assets/imgs/youtube.png", "textIcon": "فيديو"},
    {"img": "lib/assets/imgs/hiking.png", "textIcon": "النشاطات"},
    {"img": "lib/assets/imgs/notification.png", "textIcon": "مستجدات"},
    {"img": "lib/assets/imgs/picture.png", "textIcon": "صور"},
    {"img": "lib/assets/imgs/icon.png", "textIcon": "انجازاتنا"},
    {"img": "lib/assets/imgs/phone-book.png", "textIcon": "اتصل بنا"},
    {"img": "lib/assets/imgs/email.png", "textIcon": "ارسل رسالة"},
    {"img": "lib/assets/imgs/about-us.png", "textIcon": "معلومات عنا"},
  ];
  ComponentHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.count(
      crossAxisCount: 3,
      padding: const EdgeInsets.only(top: 50),
      childAspectRatio: (1 / .6),
      mainAxisSpacing: 20,
      crossAxisSpacing: 1.0, // add some space
      children: iconList
          .map(
            (item) => Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item["nav"]),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 13),
                    child: Image.asset(
                      item["img"],
                      height: 54,
                      width: 54,
                    ),
                  ),
                ),
                Text(item["textIcon"]),
              ],
            ),
          )
          .toList(),
    ));
  }
}
