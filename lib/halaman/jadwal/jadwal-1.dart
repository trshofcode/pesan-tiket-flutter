import 'package:flutter/material.dart';
import 'package:absensi/blocs/jadwal.dart';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/jadwal.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:absensi/models/acara.dart';

class JadwalPage extends StatefulWidget {
  JadwalPageState createState() => JadwalPageState();
}

class JadwalPageState extends State<JadwalPage> {
  late Map<DateTime, List<Acara>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  late JadwalBloc bloc;
  @override
  void initState() {
    super.initState();
    selectedEvents = {};
    bloc = JadwalBloc();
  }

  List<Acara> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acara"),
      ),
      body: Column(
        children: [
          TableCalendar(
            focusedDay: DateTime.now(),
            firstDay: DateTime(1990),
            lastDay: DateTime(2050),
            onFormatChanged: (CalendarFormat _format) {
              setState(() {
                format = _format;
              });
            },
            startingDayOfWeek: StartingDayOfWeek.sunday,
            daysOfWeekVisible: true,
            onDaySelected: (DateTime selectDay, DateTime focusDay) {
              setState(() {
                selectedDay = selectDay;
                focusedDay = focusDay;
              });
              print(focusedDay);
            },
            selectedDayPredicate: (DateTime date) {
              return isSameDay(selectedDay, date);
            },
            eventLoader: _getEventsfromDay,
            calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                )),
            headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                formatButtonShowsNext: true),
          ),
          ..._getEventsfromDay(selectedDay).map((Acara event) => ListTile(
                leading: Text(event.kegiatan),
              )),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Add Event"),
            content: TextFormField(
              controller: _eventController,
            ),
            actions: [
              TextButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  if (_eventController.text.isEmpty) {
                  } else {
                    if (selectedEvents[selectedDay] != null) {
                      selectedEvents[selectedDay]!.add(
                        Acara(
                          kegiatan: _eventController.text,
                          tanggal: _eventController.text,
                        ),
                      );
                    } else {
                      selectedEvents[selectedDay] = [
                        Acara(
                          kegiatan: _eventController.text,
                          tanggal: _eventController.text,
                        ),
                      ];
                    }
                  }
                  Navigator.pop(context);
                  _eventController.clear();
                  setState(() {});
                  return;
                },
              ),
            ],
          ),
        ),
        label: Text(''),
        icon: Icon(Icons.add),
      ),
    );
  }
}
