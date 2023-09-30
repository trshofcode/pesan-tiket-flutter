import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class HistoriHalaman extends StatefulWidget {
  HistoriState createState() => HistoriState();
}

class HistoriState extends State<HistoriHalaman> {
  String pathPDF = "";

  @override
  void initState() {
    super.initState();
    fromAsset('assets/demo-link.pdf', 'demo.pdf').then((f) {
      setState(() {
        pathPDF = f.path;
      });
    });
  }

  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PDFScreen(path: pathPDF),
                  ),
                );
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.asset(
                        'assets/slider/logo.jpg',
                        height: 20,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 3.0),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        leading: Image(
                            image: AssetImage("assets/icon/icon-pdf.png"),
                            height: 40),
                        title: Text("Konser_Pamungkas_id192131.pdf"),
                      ),
                    ),
                  ),
                  SizedBox(height: 1.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class PDFScreen extends StatefulWidget {
  final String? path;

  PDFScreen({Key? key, this.path}) : super(key: key);

  _PDFScreenState createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> with WidgetsBindingObserver {
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konser Pamungkas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {},
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            enableSwipe: true,
            swipeHorizontal: true,
            autoSpacing: false,
            pageFling: true,
            pageSnap: true,
            defaultPage: currentPage!,
            fitPolicy: FitPolicy.BOTH,
            preventLinkNavigation:
                false, // if set to true the link is handled in flutter
            onRender: (_pages) {
              setState(() {
                pages = _pages;
                isReady = true;
              });
            },
            onError: (error) {
              setState(() {
                errorMessage = error.toString();
              });
              print(error.toString());
            },
            onPageError: (page, error) {
              setState(() {
                errorMessage = '$page: ${error.toString()}';
              });
              print('$page: ${error.toString()}');
            },
            onViewCreated: (PDFViewController pdfViewController) {
              _controller.complete(pdfViewController);
            },
            onLinkHandler: (String? uri) {
              print('goto uri: $uri');
            },
            onPageChanged: (int? page, int? total) {
              print('page change: $page/$total');
              setState(() {
                currentPage = page;
              });
            },
          ),
          errorMessage.isEmpty
              ? !isReady
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container()
              : Center(
                  child: Text(errorMessage),
                )
        ],
      ),
    );
  }
}
