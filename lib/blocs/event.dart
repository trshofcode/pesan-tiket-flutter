import 'dart:async';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/event.dart';
import 'package:absensi/repositories/event.dart';

class EventBloc {
  late EventRepository repository;
  StreamController<ApiResponse<List<Event>>> listController =
      StreamController<ApiResponse<List<Event>>>();
  StreamSink<ApiResponse<List<Event>>> get listSink => listController.sink;
  Stream<ApiResponse<List<Event>>> get listStream => listController.stream;
  EventBloc() {
    repository = EventRepository();
    fetchList();
  }
  fetchList() async {
    listSink.add(ApiResponse.loading('Memuat Event'));
    try {
      List<Event> data = await repository.fetchList();
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
