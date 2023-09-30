import 'dart:collection';
import 'package:table_calendar/table_calendar.dart';

/// Example Acara class.
class Acara {
  late final String kegiatan;
  late final String tanggal;

  @override
  String toString() => kegiatan;

  Acara({required this.kegiatan, required this.tanggal});

  Acara.fromJson(Map<String, dynamic> json) {
    kegiatan = json['kegiatan'];
    tanggal = json['tanggal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kegiatan'] = this.kegiatan;
    data['tanggal'] = this.tanggal;
    return data;
  }

  Acara copyWith({
    required String kegiatan,
    required String tanggal,
  }) {
    return Acara(
      kegiatan: kegiatan ?? this.kegiatan,
      tanggal: tanggal ?? this.tanggal,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'kegiatan': kegiatan,
      'tanggal': tanggal,
    };
  }
}
