import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/models/tiket.dart';
import 'package:absensi/responses/tiket.dart';

class TiketRepository {
  ApiBaseHelper api = ApiBaseHelper();

  Future<List<Tiket>> fetchList() async {
    final response = await api.get("http://192.168.1.12:3000/tiket");
    //final response = await api.get("http://udb.ac.id:3000/tiket");
    return TiketResponse.fromJson(response).results;
  }
}
