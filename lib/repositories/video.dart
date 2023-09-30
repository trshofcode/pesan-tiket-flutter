import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/models/video.dart';
import 'package:absensi/responses/video.dart';

class VideoRepository {
  ApiBaseHelper api = ApiBaseHelper();
  Future<List<Video>> fetchList() async {
    final response = await api.get("http://192.168.1.12:3000/video");
    //final response = await api.get("http://sopingi.com/udb/video.json");
    return VideoResponse.fromJson(response).results;
  }
}
