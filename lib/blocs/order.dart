import 'dart:async';

import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/order.dart';
import 'package:absensi/repositories/order.dart';

class OrderBloc {
  late OrderRepository repository;
  StreamController<ApiResponse<List<Order>>> listController =
      StreamController<ApiResponse<List<Order>>>();

  StreamSink<ApiResponse<List<Order>>> get listSink => listController.sink;
  Stream<ApiResponse<List<Order>>> get listStream => listController.stream;

  OrderBloc() {
    repository = OrderRepository();
    fetchList();
  }

  fetchList() async {
    listSink.add(ApiResponse.loading('Memuat Order'));
    try {
      List<Order> data = await repository.fetchList();
      listSink.add(ApiResponse.completed(data));
    } catch (e) {
      listSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    listController.close();
  }
}
