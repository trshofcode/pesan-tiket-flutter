import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:absensi/halaman/tentang.dart';
import 'package:absensi/halaman/profile/akun.dart';
import 'package:absensi/halaman/berita.dart';
import 'package:absensi/halaman/video.dart';
import 'package:absensi/halaman/peta.dart';
import 'package:absensi/halaman/info.dart';
import 'package:absensi/halaman/jadwal/jadwal-1.dart';
import 'package:absensi/halaman/tiket/navbar.dart';
import 'package:url_launcher/url_launcher.dart';

Widget widgetLogo(BuildContext context) {
  return Container(
    //padding: EdgeInsets.all(5.0),
    //decoration:
    //BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0))),
    margin: EdgeInsets.only(bottom: 15.0, top: 5.0),
    child: ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Stack(
          //child: Column(
          children: [
            //Column(
            Image.asset('assets/slider/header.png'),
            //imageUrl: 'http://kembotech.000webhostapp.com/webservice/header.png',
            //height: 200,
            //fit: BoxFit.cover,
            // ),
          ]),
    ),
  );
}

Widget widgetMenu(BuildContext context) {
  return new Container(
      child: GridView.count(
          crossAxisCount: 3,
          shrinkWrap: true,
          crossAxisSpacing: 45.0,
          mainAxisSpacing: 15,
          childAspectRatio: 3 / 3,
          padding: EdgeInsets.only(bottom: 10),
          children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Tentang(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-tentang.png"),
                  height: 50,
                ),
                Text("Tentang"),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //print("Klik menu BERITA");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BeritaHalaman(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-berita.png"),
                  height: 50,
                ),
                Text("Berita")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //print("Klik menu INFO");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoHalaman(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-info.png"),
                  height: 50,
                ),
                Text("Info")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            //print("Klik menu VIDEO");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoHalaman(),
              ),
            );
            //final url = 'https://www.m.youtube.com/c/EventSoloRaya';

            //if (await canLaunch(url)) {
            //await launch(url);
            //}
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-video.png"),
                  height: 50,
                ),
                Text("Video")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //print("Klik menu PETA");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PetaHalaman(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-peta.png"),
                  height: 50,
                ),
                Text("Peta")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //print("Klik menu JADWAL");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JadwalPage(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-jadwal.png"),
                  height: 50,
                ),
                Text("Jadwal")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            //print("Klik menu TIKET");
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Nav(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-tiket.png"),
                  height: 50,
                ),
                Text("Tiket")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Akun(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-akun.png"),
                  height: 50,
                ),
                Text("Akun")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            //print("Klik menu WEB");
            //Navigator.push(
            //  context,
            //MaterialPageRoute(
            //builder: (context) => Web(),
            //));
            final url = 'http://www.eventsolo.com';

            if (await canLaunch(url)) {
              await launch(url);
            }
          },
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF61d6c2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black, //edited
                      spreadRadius: -2,
                      blurRadius: 5 //edited
                      )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icon/icon-web.png"),
                  height: 50,
                ),
                Text("Web")
              ],
            ),
          ),
        ),
      ]));
}

final List<String> listGambar = [
  'assets/slider/slider1.png',
  'assets/slider/slider2.png',
  'assets/slider/slider3.png'
];

final List<Widget> slideGambar = listGambar
    .map((item) => Container(
          child: Container(
            margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                child: Stack(
                  children: <Widget>[
                    Image.asset(item, fit: BoxFit.cover, width: 700.0),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ))
    .toList();

Widget widgetGambar = new CarouselSlider(
  options: CarouselOptions(
    autoPlay: true,
    aspectRatio: 2.0,
    enlargeCenterPage: true,
  ),
  items: slideGambar,
);

Widget homeBody(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: ListView(
      children: [widgetLogo(context), widgetMenu(context), widgetGambar],
    ),
  );
}
