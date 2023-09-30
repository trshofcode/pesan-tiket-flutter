import 'dart:convert';

class Jadwal {
  final String id;
  final String kegiatan;
  final DateTime tanggal;
  final String jam;

  Jadwal({
    required this.id,
    required this.kegiatan,
    required this.tanggal,
    required this.jam,
  });

  Jadwal copyWith({
    required String title,
    required String id,
    required String kegiatan,
    required DateTime tanggal,
    required String jam,
  }) {
    return Jadwal(
      id: id ?? this.id,
      kegiatan: kegiatan ?? this.kegiatan,
      tanggal: tanggal ?? this.tanggal,
      jam: jam ?? this.jam,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kegiatan': kegiatan,
      'tanggal': tanggal.millisecondsSinceEpoch,
      'jam': jam,
    };
  }

  factory Jadwal.fromMap(Map<String, dynamic> map) {
//    if (map == null) return null;

    return Jadwal(
      id: map['id'],
      kegiatan: map['kegiatan'],
      tanggal: DateTime.fromMillisecondsSinceEpoch(map['tanggal']),
      jam: map['jam'],
    );
  }
  String toJson() => json.encode(toMap());

  factory Jadwal.fromJson(String source) => Jadwal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Jadwal(id: $id, kegiatan: $kegiatan, tanggal: $tanggal, jam: $jam)';
  }

  @override
  int get hashCode {
    return id.hashCode ^ kegiatan.hashCode ^ tanggal.hashCode ^ jam.hashCode;
  }
}
