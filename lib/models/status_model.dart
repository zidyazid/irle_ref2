class StatusModel {
  int id;
  int userId;
  int materiId;
  int submenuId;
  int score;
  String judul;
  String judulSubmenu;
  DateTime createdAt;
  DateTime updatedAt;

  StatusModel(
      {this.id,
      this.userId,
      this.materiId,
      this.submenuId,
      this.score,
      this.judul,
      this.judulSubmenu,
      this.createdAt,
      this.updatedAt});

  StatusModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    materiId = json["id_materi"];
    submenuId = json["submenu_id"];
    score = json["score"];
    judul = json['judul'];
    judulSubmenu = json['judul_submenu'];
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
      'submenu_id': submenuId,
      'judul': judul,
      'judul_submenu': judulSubmenu,
    };
  }
}
