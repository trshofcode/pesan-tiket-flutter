import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/models/info.dart';
import 'package:absensi/responses/info.dart';

class InfoRepository {
  ApiBaseHelper api = ApiBaseHelper();

  Future<List<Info>> fetchList() async {
    final response = await api.get("http://192.168.1.12:3000/info");
    //final response = await api.get("http://sopingi.com/udb/berita.json");
    return InfoResponse.fromJson(response).results;
  }
}
