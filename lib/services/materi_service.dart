import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irle_ref2/models/materi_model.dart';

class MateriService {
  String baseUrl = "http://192.168.43.18:8000/api";

  Future<List<MateriModel>> getMateries() async {
    var url = "$baseUrl/materi";
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(jsonDecode(response.body)['data']);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<MateriModel> materies = [];

      for (var item in data) {
        materies.add(MateriModel.fromJson(item));
      }

      return materies;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }
}
