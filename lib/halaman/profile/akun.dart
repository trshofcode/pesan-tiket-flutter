import 'package:flutter/material.dart';
import 'package:absensi/blocs/akun.dart';
import 'detail.dart';
import 'setting.dart';

class Akun extends StatefulWidget {
  AkunState createState() => AkunState();
}

class AkunState extends State<Akun> {
  late AkunBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = AkunBloc();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Akun"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(children: [
            Text(
              "Anggota Kelompok :",
              style: TextStyle(fontSize: 25),
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Reynendra Irfan Prasetya - 180103128",
              press: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new Setting();
                    },
                    fullscreenDialog: true));
              },
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Putra Karya Santoso - 180103124",
              press: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new Setting();
                    },
                    fullscreenDialog: true));
              },
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Yusril Esa M - 180103169",
              press: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new Setting();
                    },
                    fullscreenDialog: true));
              },
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Suryo Nugroho - 180103149",
              press: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new Setting();
                    },
                    fullscreenDialog: true));
              },
            ),
            Detail(
              icon: "assets/icon/Camera Icon.svg",
              text: "Idris Asadul Usud - 180103076",
              press: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new Setting();
                    },
                    fullscreenDialog: true));
              },
            )
          ]),
        ));
  }
}
