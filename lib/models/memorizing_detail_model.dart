class MemorizingDetailModel {
  int id;
  int userId;
  int vocabullaryId;
  String verb1;
  String verb2;
  String verb3;
  String verbing;
  String translate;
  DateTime createdAt;
  DateTime updatedAt;

  MemorizingDetailModel(
      {this.id,
      this.userId,
      this.vocabullaryId,
      this.verb1,
      this.verb2,
      this.verb3,
      this.verbing,
      this.translate,
      this.createdAt,
      this.updatedAt});

  MemorizingDetailModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["userId"];
    vocabullaryId = json["vocabullaryId"];
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
      'user_id': userId,
      'vocabullary_id': vocabullaryId,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'verb1': verb1,
      'verb2': verb2,
      'verb3': verb3,
      'verbing': verbing,
      'translate': translate,
    };
  }
}
