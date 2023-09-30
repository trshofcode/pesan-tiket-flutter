class Berita {
  late int id;
  late String judul;
  late String konten;
  late String foto;

  Berita(
      {required this.id,
      required this.judul,
      required this.konten,
      required this.foto});

  Berita.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    judul = json['judul'];
    konten = json['konten'];
    foto = json['foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['judul'] = this.judul;
    data['konten'] = this.konten;
    data['foto'] = this.foto;
    return data;
  }
}
