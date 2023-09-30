import 'package:flutter/material.dart';
import 'package:absensi/halaman/home.dart';
import 'dart:async';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  startSplashScreen() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) {
          return Home();
        }),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff329cef),
        body: Center(
          child: Image.asset(
            "assets/icon/logo-header.png",
            height: 200.0,
            width: 400.0,
          ),
        ));
  }
}
