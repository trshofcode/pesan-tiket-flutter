import 'dart:async';

import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/video.dart';
import 'package:absensi/repositories/video.dart';

class VideoBloc {
  late VideoRepository repository;
  StreamController<ApiResponse<List<Video>>> listController =
      StreamController<ApiResponse<List<Video>>>();

  StreamSink<ApiResponse<List<Video>>> get listSink => listController.sink;
  Stream<ApiResponse<List<Video>>> get listStream => listController.stream;

  VideoBloc() {
    repository = VideoRepository();
    fetchList();
  }

  fetchList() async {
    listSink.add(ApiResponse.loading('Memuat video'));
    try {
      List<Video> data = await repository.fetchList();
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
