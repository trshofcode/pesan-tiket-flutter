import 'package:absensi/models/order.dart';

class OrderResponse {
  late List<Order> results;

  OrderResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      results = <Order>[];
      json['data'].forEach((v) {
        results.add(new Order.fromJson(v));
      });
    }
  }
}
