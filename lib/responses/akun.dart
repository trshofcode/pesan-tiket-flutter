import 'package:absensi/models/akun.dart';

class AkunResponse {
  late List<Akun> results;

  AkunResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      results = <Akun>[];
      json['data'].forEach((v) {
        results.add(new Akun.fromJson(v));
      });
    }
  }
}
