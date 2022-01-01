class MateriModel {
  int id;
  String judul;
  String penjelasan;
  String strukturPos;
  String strukturNegatif;
  String strukturPertanyaan;
  String contohPos;
  String contohNegatif;
  String contohPertanyaan;
  DateTime createdAt;
  DateTime updatedAt;
  int categoriesId;
  String name;

  MateriModel({
    this.id,
    this.judul,
    this.penjelasan,
    this.strukturPos,
    this.strukturNegatif,
    this.strukturPertanyaan,
    this.contohPos,
    this.contohNegatif,
    this.contohPertanyaan,
    this.createdAt,
    this.updatedAt,
    this.categoriesId,
    this.name,
  });

  MateriModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    judul = json["judul"];
    penjelasan = json["penjelasan"];
    strukturPos = json["struktur_pos"];
    strukturNegatif = json["struktur_negatif"];
    strukturPertanyaan = json["struktur_pertanyaan"];
    contohPos = json["contoh_pos"];
    contohNegatif = json["contoh_negatif"];
    contohPertanyaan = json["contoh_pertanyaan"];
    createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
    updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);
    categoriesId = int.parse(json["categoriesId"].toString());
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'judul': judul,
      'penjelasan': penjelasan,
      'struktur_pos': strukturPos,
      'struktur_negatif': strukturNegatif,
      'struktur_pertanyaan': strukturPertanyaan,
      'contoh_pos': contohPos,
      'contoh_negatif': contohNegatif,
      'contoh_pertanyaan': contohPos,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'categoriesId': categoriesId.toString(),
      'name': name,
    };
  }
}
