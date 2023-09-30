class Akun {
  late String username;
  late String nama;
  late String jk;
  late String alamat;
  late int no_telp;
  late String pass;

  Akun(
      {required this.username,
      required this.nama,
      required this.jk,
      required this.alamat,
      required this.no_telp,
      required this.pass});

  Akun.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    nama = json['nama'];
    jk = json['jk'];
    alamat = json['alamat'];
    no_telp = json['no_telp'];
    pass = json['pass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['nama'] = this.nama;
    data['jk'] = this.jk;
    data['alamat'] = this.alamat;
    data['no_telp'] = this.no_telp;
    data['pass'] = this.pass;
    return data;
  }
}
