import 'dart:async';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/info.dart';
import 'package:absensi/repositories/info.dart';

class InfoBloc {
  late InfoRepository repository;
  StreamController<ApiResponse<List<Info>>> listController =
      StreamController<ApiResponse<List<Info>>>();
  StreamSink<ApiResponse<List<Info>>> get listSink => listController.sink;
  Stream<ApiResponse<List<Info>>> get listStream => listController.stream;
  InfoBloc() {
    repository = InfoRepository();
    fetchList();
  }
  fetchList() async {
    listSink.add(ApiResponse.loading('Memuat Info'));
    try {
      List<Info> data = await repository.fetchList();
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
