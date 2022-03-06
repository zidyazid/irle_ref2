class SubmenuModel {
  int id;
  int materiId;
  String judul;
  String penjelasan;
  DateTime createdAt;
  DateTime updatedAt;

  SubmenuModel(
      {this.id,
      this.materiId,
      this.judul,
      this.penjelasan,
      this.createdAt,
      this.updatedAt});

  SubmenuModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    materiId = json["materi_id"];
    judul = json["judul"];
    penjelasan = json["penjelasan"];
    createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
    updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
  }

  Map<String, dynamic> toJson() {
    // NOTE: MENGEMBALIKAN NILAI JSON
    return {
      'id': id,
      'materi_id': materiId,
      'judul': judul,
      'penjelasan': penjelasan,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString()
    };
  }
}
