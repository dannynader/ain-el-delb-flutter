// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:aineldelb/component/NavBar.dart';

class mokhtar extends StatefulWidget {
  const mokhtar({ Key? key }) : super(key: key);

  @override
  State<mokhtar> createState() => _mokhtarState();
}


class _mokhtarState extends State<mokhtar> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title:const Text("المخاتير"),
        backgroundColor: const Color.fromRGBO(103, 0, 103, 1),
          actions: [IconButton(
    icon: const Icon(Icons.arrow_forward, color: Colors.white),
    onPressed: () => Navigator.of(context).pop(),
  ), ],
      ),
      body: SingleChildScrollView(
        child:
        Card(
margin:const EdgeInsets.all(10.0),
          child:Column(
          children: [
            const Text("insert mokhtar name"),
            Image.asset("lib/assets/imgs/man-user.png"),
            const Text("تلك أميركا منذ عقل الخليج الحدود موجه وبعد عواقب ككل أكثر يحتاج النوعية انه والإسلاميين المؤسسات وغير نادرا مثل العراق مــصـر قليل السعودية تهدد على قالوا انهم أميركا والأقليات، السلاح تمتلك زي وإيران ولكنها عن بأسلحة معها للإمارات الأمنية كبيرة ودول وأعداد وأن العربية وأن لم الثائرة رأسهم يمكن القرار يقول لكم ليست من إلى مسئولة بخصوص تبيع القوات تتعارض آلاف باتت ليست تؤثر في سبيل أن وهم في تدخل اريد أميركا يشير "),
          ],
        ),)
      )
    );
  }
}