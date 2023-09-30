import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/models/acara.dart';
import 'package:absensi/responses/jadwal.dart';

class JadwalRepository {
  ApiBaseHelper api = ApiBaseHelper();

  Future<List<Acara>> fetchList() async {
    final response = await api.get("http://192.168.1.12:3000/jadwal");
    //final response = await api.get("http://sopingi.com/udb/berita.json");
    return JadwalResponse.fromJson(response).results;
  }
}
