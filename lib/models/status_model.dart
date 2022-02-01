class StatusModel {
  int id;
  int userId;
  int materiId;
  int score;
  String judul;
  DateTime createdAt;
  DateTime updatedAt;

  StatusModel(
      {this.id,
      this.userId,
      this.materiId,
      this.score,
      this.judul,
      this.createdAt,
      this.updatedAt});

  StatusModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    materiId = json["id_materi"];
    score = json["score"];
    judul = json['judul'];
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
      'id_materi': materiId,
      'score': score,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'user_id': userId,
      'judul': judul,
    };
  }
}
