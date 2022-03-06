import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irle_ref2/models/submenu_model.dart';

class SubmenuService {
  String baseUrl = "http://192.168.43.18:8000/api";

  Future<List<SubmenuModel>> gatSubmenuModel(id) async {
    var url = "$baseUrl/submenu?id=$id";
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(jsonDecode(response.body)['data']);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<SubmenuModel> subMenu = [];

      for (var item in data) {
        subMenu.add(SubmenuModel.fromJson(item));
      }
      return subMenu;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }
}
