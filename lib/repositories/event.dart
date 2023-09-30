import 'package:absensi/api/api_base_helper.dart';
import 'package:absensi/models/event.dart';
import 'package:absensi/responses/event.dart';

class EventRepository {
  ApiBaseHelper api = ApiBaseHelper();

  Future<List<Event>> fetchList() async {
    final response = await api.get("http://192.168.1.12:3000/event");
    //final response = await api.get("http://sopingi.com/udb/event.json");
    return EventResponse.fromJson(response).results;
  }
}
