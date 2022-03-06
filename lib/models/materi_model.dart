import 'package:irle_ref2/models/submenu_model.dart';

class MateriModel {
  int id;
  String judul;
  DateTime createdAt;
  DateTime updatedAt;
  // List<SubmenuModel> submenu;
  List submenu;

  MateriModel(
      {this.id, this.judul, this.createdAt, this.updatedAt, this.submenu});

  MateriModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    judul = json["judul"];
    createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String);
    updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String);

    submenu = json['submenu'];
    // .map<SubmenuModel>((subMenu) => SubmenuModel.fromJson(subMenu))
    // .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.toString(),
      'judul': judul,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString(),
      'submenu': submenu,
    };
  }
}
