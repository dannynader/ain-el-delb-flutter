import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
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

// Image.asset('lib/assets/imgs/logo.png');