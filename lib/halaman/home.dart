import 'package:flutter/material.dart';
import 'package:absensi/halaman/home_body.dart';

class Home extends StatefulWidget {
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset('assets/icon/logo-header.png',
              fit: BoxFit.contain, height: 100),
        ])),
        body: homeBody(context));
  }
}
