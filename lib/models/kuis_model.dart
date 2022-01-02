class KuisModel {
  int id;
  int materiId;
  String pertanyaan;
  String jawaban;
  DateTime createdAt;
  DateTime updatedAt;

  KuisModel(
      {this.id,
      this.materiId,
      this.pertanyaan,
      this.jawaban,
      this.createdAt,
      this.updatedAt});

  KuisModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    materiId = json["materi_id"];
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
      'materi_id': materiId.toString(),
      'pertanyaan': pertanyaan,
      'jawaban': jawaban,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
    };
  }
}
