class Tiket {
  //atribut
  late int id;
  late String paket;
  late int harga;

  //metod kontruktor
  Tiket({required this.id, required this.paket, required this.harga});

  Tiket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paket = json['paket'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['paket'] = this.paket;
    data['harga'] = this.harga;
    return data;
  }
}
