import 'package:flutter/material.dart';
import 'package:absensi/blocs/video.dart';
import 'package:absensi/api/api_response.dart';
import 'package:absensi/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoHalaman extends StatefulWidget {
  VideoState createState() => VideoState();
}

class VideoState extends State<VideoHalaman> {
  late VideoBloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = VideoBloc();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video"),
      ),
      body: Container(
        padding: EdgeInsets.all(2.0),
        child: RefreshIndicator(
          onRefresh: () => bloc.fetchList(),
          child: StreamBuilder<ApiResponse<List<Video>>>(
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
                    return VideoList(list: snapshot.data!.data);
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

//LIST VIDEO
class VideoList extends StatelessWidget {
  final List<Video> list;
  const VideoList({Key? key, required this.list}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      primary: true,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, index) {
        int reverseIndex = list.length - 1 - index;
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
                      return new VideoDetail(
                        judul: list[reverseIndex].judul,
                        videoId: list[reverseIndex].videoId,
                      );
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
                      child: Image.asset(
                        'assets/slider/video.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.0),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        '${list[reverseIndex].judul}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.left,
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

//DETAIL VIDEO
class VideoDetail extends StatelessWidget {
  VideoDetail({key, required this.judul, required this.videoId})
      : super(key: key);
  final String judul;
  final String videoId;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text(judul),
        ),
        body: Padding(
            padding: EdgeInsets.all(5.0),
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: videoId,
                flags: YoutubePlayerFlags(),
              ),
              showVideoProgressIndicator: true,
            )));
  }
}
