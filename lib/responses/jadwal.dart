import 'package:absensi/models/acara.dart';

class JadwalResponse {
  late List<Acara> results;

  JadwalResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      results = <Acara>[];
      json['data'].forEach((v) {
        results.add(new Acara.fromJson(v));
      });
    }
  }
}
