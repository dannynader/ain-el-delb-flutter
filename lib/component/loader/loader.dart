import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/assets/imgs/logo.png',
      fit: BoxFit.fill,
      alignment: Alignment.center,
      height: double.infinity,
      width: double.infinity,
    );
  }
}