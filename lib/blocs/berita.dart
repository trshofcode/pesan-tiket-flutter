import 'dart:async';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/berita.dart';
import 'package:absensi/repositories/berita.dart';

class BeritaBloc {
  late BeritaRepository repository;
  StreamController<ApiResponse<List<Berita>>> listController =
      StreamController<ApiResponse<List<Berita>>>();
  StreamSink<ApiResponse<List<Berita>>> get listSink => listController.sink;
  Stream<ApiResponse<List<Berita>>> get listStream => listController.stream;
  BeritaBloc() {
    repository = BeritaRepository();
    fetchList();
  }
  fetchList() async {
    listSink.add(ApiResponse.loading('Memuat berita'));
    try {
      List<Berita> data = await repository.fetchList();
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
