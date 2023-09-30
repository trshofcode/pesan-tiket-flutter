import 'package:absensi/models/tiket.dart';

class TiketResponse {
  late List<Tiket> results;

  TiketResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      results = <Tiket>[];
      json['data'].forEach((v) {
        results.add(new Tiket.fromJson(v));
      });
    }
  }
}
