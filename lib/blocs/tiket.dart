import 'dart:async';

import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/tiket.dart';
import 'package:absensi/repositories/tiket.dart';

class TiketBloc {
  late TiketRepository repository;
  StreamController<ApiResponse<List<Tiket>>> listController =
      StreamController<ApiResponse<List<Tiket>>>();

  StreamSink<ApiResponse<List<Tiket>>> get listSink => listController.sink;
  Stream<ApiResponse<List<Tiket>>> get listStream => listController.stream;

  TiketBloc() {
    repository = TiketRepository();
    fetchList();
  }

  fetchList() async {
    listSink.add(ApiResponse.loading('Memuat tiket'));
    try {
      List<Tiket> data = await repository.fetchList();
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
