import 'package:absensi/models/video.dart';

class VideoResponse {
  late List<Video> results;
  VideoResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
// ignore: deprecated_member_use
      results = <Video>[];
      json['data'].forEach((v) {
        results.add(new Video.fromJson(v));
      });
    }
  }
}
