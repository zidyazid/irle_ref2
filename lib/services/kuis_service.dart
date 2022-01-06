import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irle_ref2/models/kuis_model.dart';

class KuisService {
  String baseUrl = "http://192.168.43.18:8000/api";

  Future<List<KuisModel>> getKuises(id) async {
    // SELANJUTNYA COBA LAKUKAN [ERUBAHAN PADA PARAMETER DARI id MENJADI materi_id
    var url = "$baseUrl/quiz?id=$id";

    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<KuisModel> kuises = [];

      for (var item in data) {
        kuises.add(KuisModel.fromJson(item));
      }

      return kuises;
    } else {
      print(response.statusCode);
      throw Exception('Gagal Mengambil Data');
    }
  }
}
