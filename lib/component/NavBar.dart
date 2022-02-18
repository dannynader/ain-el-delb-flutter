import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final List menuIcon =[
//  {"title": 'الصفحة الرئيسية', "url": '/home', "icon": 'assets/imgs/home.png'},
        // {"title": 'المجلس البلدي', "url": 'town-council', "icon": 'assets/imgs/public-museum-sign.png'},
        // {"title": 'المخاتير', "url": 'mukhtar', "icon": 'assets/imgs/man-user.png'},
        // {"title": 'النشاطات', "url": 'ActivitiesPage', "icon": 'assets/imgs/hiking.png'},
        // {"title": 'في الإعلام', "url": 'medias', "icon": 'assets/imgs/newspaper.png'},
        // {"title": 'صور', "url": 'pictures', "icon": 'assets/imgs/picture.png'},
        // {"title": 'انجازاتنا', "url": 'achievements', "icon": 'assets/imgs/icon.png'},
        // {"title": 'معلومات عنا', "url": 'aboutus', "icon": 'assets/imgs/about-us.png'},
        {"title": 'اتصل بنا', "url": 'contact-us', "icon": 'assets/imgs/phone-book.png'},
  ];
   NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child:  ListView(
    children: [
      const DrawerHeader(
       margin: EdgeInsets.only(bottom: 1.0),
       padding:EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
        child: Text('Drawer Header'),
      ),
      ListTile(
        title: const Text('الصفحة الرئيسية'),
        leading: Image.asset('lib/assets/imgs/home.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),
         ListTile(
        title: const Text('المجلس البلدي'),
        leading: Image.asset('lib/assets/imgs/public-museum-sign.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),
         ListTile(
        title: const Text('المخاتير'),
        leading: Image.asset('lib/assets/imgs/man-user.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),   ListTile(
        title: const Text('النشاطات'),
        leading: Image.asset('lib/assets/imgs/hiking.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),   ListTile(
        title: const Text('في الإعلام'),
        leading: Image.asset('lib/assets/imgs/newspaper.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),   ListTile(
        title: const Text('صور'),
        leading: Image.asset('lib/assets/imgs/picture.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),   ListTile(
        title: const Text('انجازاتنا'),
        leading: Image.asset('lib/assets/imgs/icon.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),   ListTile(
        title: const Text('معلومات عنا'),
        leading: Image.asset('lib/assets/imgs/about-us.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),   ListTile(
        title: const Text('اتصل بنا'),
        leading: Image.asset('lib/assets/imgs/phone-book.png',height: 40,width: 40,),
        onTap: () {
           Navigator.pop(context);
        },
      ),
    ],
  ),
    );
  }
}