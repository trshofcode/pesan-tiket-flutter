import 'package:absensi/halaman/tiket/tiket.dart';
import 'package:flutter/material.dart';
import 'package:absensi/blocs/event.dart';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/event.dart';
import 'package:intl/intl.dart';

class EventHalaman extends StatefulWidget {
  EventState createState() => EventState();
}

class EventState extends State<EventHalaman> {
  late EventBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = EventBloc();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event"),
      ),
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: RefreshIndicator(
          onRefresh: () => bloc.fetchList(),
          child: StreamBuilder<ApiResponse<List<Event>>>(
            stream: bloc.listStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                switch (snapshot.data!.status) {
                  case Status.LOADING:
                    return Text(snapshot.data!.message,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis);
                    break;
                  case Status.COMPLETED:
                    return EventList(list: snapshot.data!.data);
                    break;
                  case Status.ERROR:
                    return InkWell(
                      child: Text(snapshot.data!.message),
                      onTap: () {
                        bloc.fetchList();
                      },
                    );
                    break;
                }
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

//LIST Event
class EventList extends StatelessWidget {
  final List<Event> list;
  const EventList({Key? key, required this.list}) : super(key: key);
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(3.0),
          child: Card(
            elevation: 3.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute<Null>(
                    builder: (BuildContext context) {
                      return new TiketHalaman();
                    },
                    fullscreenDialog: true));
              },
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.network(
                        "http://bit.ly/${list[index].foto}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: ListTile(
                        title: Text('${list[index].judul}'),
                        subtitle: Text('${list[index].tanggal}'),
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
