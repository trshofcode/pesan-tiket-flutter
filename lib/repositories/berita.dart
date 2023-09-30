import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/models/berita.dart';
import 'package:absensi/responses/berita.dart';

class BeritaRepository {
  ApiBaseHelper api = ApiBaseHelper();

  Future<List<Berita>> fetchList() async {
    final response = await api.get("http://192.168.1.12:3000/berita");
    //final response = await api.get("http://sopingi.com/udb/berita.json");
    return BeritaResponse.fromJson(response).results;
  }
}
