class Todo {
  late int? id;
  late String kegiatan;
  late String waktu;
  late String prioritas;
  late String keterangan;

  Todo({
    this.id,
    required this.kegiatan,
    required this.waktu,
    required this.prioritas,
    required this.keterangan,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'kegiatan': kegiatan,
      'waktu': waktu,
      'prioritas': prioritas,
      'keterangan': keterangan,
    };
  }

  Todo.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    kegiatan = map['kegiatan'];
    waktu = map['waktu'];
    prioritas = map['prioritas'];
    keterangan = map['keterangan'];
  }
}
