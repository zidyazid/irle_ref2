class KuisModel {
  int id;
  int submenuId;
  String pertanyaan;
  String jawaban;
  DateTime createdAt;
  DateTime updatedAt;

  KuisModel(
      {this.id,
      this.submenuId,
      this.pertanyaan,
      this.jawaban,
      this.createdAt,
      this.updatedAt});

  KuisModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    submenuId = json["submenu_id"];
    pertanyaan = json["pertanyaan"];
    jawaban = json["jawaban"];
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
      'submenu_id': submenuId.toString(),
      'pertanyaan': pertanyaan,
      'jawaban': jawaban,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
