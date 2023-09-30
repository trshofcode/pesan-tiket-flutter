import 'dart:async';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/akun.dart';
import 'package:absensi/repositories/akun.dart';

class AkunBloc {
  late AkunRepository repository;
  StreamController<ApiResponse<List<Akun>>> listController =
      StreamController<ApiResponse<List<Akun>>>();
  StreamSink<ApiResponse<List<Akun>>> get listSink => listController.sink;
  Stream<ApiResponse<List<Akun>>> get listStream => listController.stream;
  AkunBloc() {
    repository = AkunRepository();
    fetchList();
  }
  fetchList() async {
    listSink.add(ApiResponse.loading('Memuat Akun'));
    try {
      List<Akun> data = await repository.fetchList();
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
