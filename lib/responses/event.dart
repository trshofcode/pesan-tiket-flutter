import 'package:absensi/models/event.dart';

class EventResponse {
  late List<Event> results;

  EventResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      results = <Event>[];
      json['data'].forEach((v) {
        results.add(new Event.fromJson(v));
      });
    }
  }
}
