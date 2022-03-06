class KosaKataModel {
  int id;
  String regulerKategori;
  String verb1;
  String verb2;
  String verb3;
  String verbing;
  String translate;
  DateTime createdAt;
  DateTime updatedAt;

  KosaKataModel(
      {this.id,
      this.regulerKategori,
      this.verb1,
      this.verb2,
      this.verb3,
      this.verbing,
      this.createdAt,
      this.updatedAt});

  KosaKataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    regulerKategori = json["reguler_kategori"];
    verb1 = json["verb1"];
    verb2 = json["verb2"];
    verb3 = json["verb3"];
    verbing = json["verbing"];
    translate = json["translate"];
    createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
    updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reguler_kategori': regulerKategori,
      'verb1': verb1,
      'verb2': verb2,
      'verb3': verb3,
      'verbing': verbing,
      'translate': translate,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
