import 'package:flutter/material.dart';
import 'package:absensi/models/event.dart';

class EventDetailsPage extends StatelessWidget {
  final Event event;

  const EventDetailsPage({required Key key, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              event.judul,
            ),
            SizedBox(height: 20.0),
            Text(event.deskripsi)
          ],
        ),
      ),
    );
  }
}
