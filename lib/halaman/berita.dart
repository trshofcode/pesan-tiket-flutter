import 'dart:async';

import 'package:flutter/material.dart';
import 'package:absensi/blocs/berita.dart';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/berita.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BeritaHalaman extends StatefulWidget {
  BeritaState createState() => BeritaState();
}

class BeritaState extends State<BeritaHalaman> {
  late BeritaBloc bloc;
  late bool _loading;
  @override
  void initState() {
    super.initState();
    bloc = BeritaBloc();
    _loading = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Berita"),
      ),
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: RefreshIndicator(
          onRefresh: () => bloc.fetchList(),
          child: StreamBuilder<ApiResponse<List<Berita>>>(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Text(snapshot.data!.message,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis);
                    break;
                  case Status.COMPLETED:
                    return BeritaList(list: snapshot.data!.data);
                    break;
                  case Status.ERROR:
                    return InkWell(
                      child: Text(snapshot.data!.message),
                      onTap: () {
                        bloc.fetchList();
                      },
                    );
                    break;
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

//LIST BERITA
class BeritaList extends StatelessWidget {
  final List<Berita> list;
  const BeritaList({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, index) {
        int reverseIndex = list.length - 1 - index;
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new BeritaDetail(
                        judul: list[reverseIndex].judul,
                        konten: list[reverseIndex].konten,
                      );
                    },
                    fullscreenDialog: true));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: Colors.transparent,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: 'http://bit.ly/${list[reverseIndex].foto}',
                        height: 20,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '${list[reverseIndex].judul}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

//DETAIL BERITA
class BeritaDetail extends StatelessWidget {
  late WebViewController _controller;
  BeritaDetail({key, required this.judul, required this.konten})
      : super(key: key);
  final String judul;
  final String konten;
  final Completer<WebViewController> _mycontroller =
      Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(judul),
      ),
      body: WebView(
        initialUrl: konten,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          _mycontroller.complete(controller);
          _controller = controller;
        },
        onProgress: (int progress) {
          print("WebView is loading (progress : $progress%)");
        },
        onPageStarted: (String url) {
          print('Page started loading: $url');
        },
        onPageFinished: (url) {
          print('hapus: $url');
          _controller.evaluateJavascript(
              "document.getElementsByClassName('slideshow')[0].style.display='none';");
          _controller.evaluateJavascript(
              "document.getElementsByClassName('clearfix')[0].style.display='none';");
          _controller.evaluateJavascript(
              "document.getElementsByClassName('event')[0].style.display='none';");
          _controller.evaluateJavascript(
              "document.getElementsByClassName('footer_credit')[0].style.display='none';");
          _controller.evaluateJavascript(
              "document.getElementsByClassName('content')[0].style.display='none';");
        },
      ),
    );
  }
}
