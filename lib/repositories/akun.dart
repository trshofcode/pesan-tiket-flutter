import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/models/akun.dart';
import 'package:absensi/responses/akun.dart';

class AkunRepository {
  ApiBaseHelper api = ApiBaseHelper();

  Future<List<Akun>> fetchList() async {
    final response = await api.get("http://192.168.1.12:3000/akun");
    //final response = await api.get("http://sopingi.com/udb/akun.json");
    return AkunResponse.fromJson(response).results;
  }
}
