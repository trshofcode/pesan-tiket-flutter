import 'package:flutter/material.dart';

class Web extends StatefulWidget {
  WebState createState() => WebState();
}

class WebState extends State<Web> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Web"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 100,
              child: Center(
                  child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/icon/LOGO.jpg"),
                  ),
                ],
              )),
            ),
            Text(
              "In Development",
              style: TextStyle(fontSize: 15),
            ),
          ]),
        ));
  }
}
