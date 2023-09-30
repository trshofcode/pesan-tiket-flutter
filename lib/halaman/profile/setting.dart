import 'package:flutter/material.dart';
import 'detail.dart';

class Setting extends StatefulWidget {
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Setting"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(children: [
            SizedBox(
              height: 95,
              width: 95,
              child: Center(
                  child: Stack(
                fit: StackFit.expand,
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/icon/icon-Setting.png"),
                  ),
                ],
              )),
            ),
            Text(
              "Anggota Kelompok :",
              style: TextStyle(fontSize: 25),
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Akun",
              press: () {},
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Keamanan",
              press: () {},
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Setting",
              press: () {},
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Bantuan",
              press: () {},
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Log Out",
              press: () {},
            )
          ]),
        ));
  }
}
