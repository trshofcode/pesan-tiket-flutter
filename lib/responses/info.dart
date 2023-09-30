import 'package:absensi/models/info.dart';

class InfoResponse {
  late List<Info> results;

  InfoResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      results = <Info>[];
      json['data'].forEach((v) {
        results.add(new Info.fromJson(v));
      });
    }
  }
}
