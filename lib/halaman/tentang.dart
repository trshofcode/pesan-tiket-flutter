import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Tentang extends StatefulWidget {
  TentangState createState() => TentangState();
}

class TentangState extends State<Tentang> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tentang"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/slider/logo.jpg'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    'Event solo adalah sebuah website yang membahas segala hal tentang Kota Solo dari jadwal film hingga resep makanan. Aplikasi ini sendiri dibuat hanya untuk memudahkan pembelian tiket disetiap event musik yang diadakan disekitar Soloraya. Nama "ESIKLO" sendiri diambil dari kata "Event Musik Solo" disingkat agar lebih mudah untuk diingat.Ikuti juga sosial media kita yang ada dibawah agar selalu update event yang ada di Kota Solo.',
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              Padding(
                  padding: EdgeInsets.all(10.0),
                  child: GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    crossAxisSpacing: 3.0,
                    mainAxisSpacing: 3,
                    childAspectRatio: 3 / 2,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          final url = 'https://www.instagram.com/event.solo/';

                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/icon/logo-ig.png'),
                                height: 50,
                              ),
                              Text("@event.solo",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final url =
                              'https://www.youtube.com/c/EventSoloRaya/null';

                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage('assets/icon/logo-yt.png'),
                                height: 50,
                              ),
                              Text("Event Solo",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final url = 'https://twitter.com/eventsoloraya';

                          if (await canLaunch(url)) {
                            await launch(url);
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                image:
                                    AssetImage('assets/icon/logo-twitter.png'),
                                height: 50,
                              ),
                              Text("@EventSoloRaya",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
