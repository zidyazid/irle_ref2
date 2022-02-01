import 'dart:convert';

import 'package:irle_ref2/models/status_model.dart';
import 'package:http/http.dart' as http;

class StatusService {
  String baseUrl = "http://192.168.43.18:8000/api";

  Future<List<StatusModel>> getStatus(int id) async {
    var url = "$baseUrl/status?id=$id";
    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(jsonDecode(response.body)['data']);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<StatusModel> statuses = [];

      for (var item in data) {
        statuses.add(StatusModel.fromJson(item));
      }
      return statuses;
    } else {
      throw Exception('Gagal Mengambil Data');
    }
  }

  Future<bool> add(String token, int idMateri, int score, int userId) async {
    var url = '$baseUrl/add-status';
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var body =
        jsonEncode({'id_materi': idMateri, 'score': score, 'user_id': userId});

    var response = await http.post(url, headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      print('data berhasil disimpan');
      return true;
    } else {
      print(
          'token : $token, id materi : $idMateri, score : $score, user id : $userId');
      print(response.statusCode);
      print(response.reasonPhrase);
      throw Exception('Gagal Menyimpan Data');
    }
  }
}
