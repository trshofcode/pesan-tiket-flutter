import 'package:absensi/models/berita.dart';

class BeritaResponse {
  late List<Berita> results;

  BeritaResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      results = <Berita>[];
      json['data'].forEach((v) {
        results.add(new Berita.fromJson(v));
      });
    }
  }
}
