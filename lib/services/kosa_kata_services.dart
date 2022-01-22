import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irle_ref2/models/kosa_kata_model.dart';
import 'package:irle_ref2/models/kuis_model.dart';

class KosaKataServices {
  String baseUrl = "http://192.168.43.18:8000/api";

  Future<List<KosaKataModel>> getKosaKata() async {
    var url = "$baseUrl/vocabullaries";

    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<KosaKataModel> vocabullaries = [];

      for (var item in data) {
        vocabullaries.add(KosaKataModel.fromJson(item));
      }

      return vocabullaries;
    } else {
      print(response.statusCode);
      throw Exception('Gagal Mengambil Data');
    }
  }
}
