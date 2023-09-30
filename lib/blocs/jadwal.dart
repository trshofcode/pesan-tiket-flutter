import 'dart:async';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/acara.dart';
import 'package:absensi/repositories/jadwal.dart';

class JadwalBloc {
  late JadwalRepository repository;
  StreamController<ApiResponse<List<Acara>>> listController =
      StreamController<ApiResponse<List<Acara>>>();
  StreamSink<ApiResponse<List<Acara>>> get listSink => listController.sink;
  Stream<ApiResponse<List<Acara>>> get listStream => listController.stream;
  JadwalBloc() {
    repository = JadwalRepository();
    fetchList();
  }
  fetchList() async {
    listSink.add(ApiResponse.loading('Memuat Acara'));
    try {
      List<Acara> data = await repository.fetchList();
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
