class Video {
  late int id;
  late String judul;
  late String videoId;

  Video({required this.id, required this.judul, required this.videoId});

  Video.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    videoId = json['videoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['videoId'] = this.videoId;
    return data;
  }
}
