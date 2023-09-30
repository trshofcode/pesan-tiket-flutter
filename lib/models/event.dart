import 'dart:convert';

class Event {
  late int id;
  late String judul;
  late String tanggal;
  late String jam;
  late String deskripsi;
  late String foto;
  Event(
      {required this.id,
      required this.judul,
      required this.tanggal,
      required this.jam,
      required this.deskripsi,
      required this.foto});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    tanggal = DateTime.parse(json['tanggal']).toString();
    jam = json['jam'];
    deskripsi = json['deskripsi'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['tanggal'] = this.tanggal;
    data['jam'] = this.jam;
    data['deskripsi'] = this.deskripsi;
    data['foto'] = this.foto;
    return data;
  }
}
