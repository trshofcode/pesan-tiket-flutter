import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/models/order.dart';
import 'package:absensi/responses/order.dart';

class OrderRepository {
  ApiBaseHelper api = ApiBaseHelper();

  Future<List<Order>> fetchList() async {
    final response = await api.get("http://192.168.1.12:3000/order");
    //final response = await api.get("http://udb.ac.id:3000/order");
    return OrderResponse.fromJson(response).results;
  }
}
