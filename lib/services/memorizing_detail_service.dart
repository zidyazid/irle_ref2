import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irle_ref2/models/kosa_kata_model.dart';
import 'package:irle_ref2/models/memorizing_detail_model.dart';

class MemorizingDetailService {
  String baseUrl = "http://192.168.43.18:8000/api";

  Future<List<MemorizingDetailModel>> getMemorizingDetail(int id) async {
    var url = "$baseUrl/memorizing-detail?id=$id";

    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(jsonDecode(response.body)["data"]);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)["data"];
      List<MemorizingDetailModel> memorizingDetails = [];

      for (var item in data) {
        memorizingDetails.add(MemorizingDetailModel.fromJson(item));
      }

      return memorizingDetails;
    } else {
      print(response.statusCode);
      throw Exception("Gagal Mengambil data Hapalan KosaKata");
    }
  }

  Future<bool> add(String token, int userId, int kosakataId) async {
    var url = '$baseUrl/add-memorizing-detail';
    var headers = {'Content-Type': 'application/json', 'Authorization': token};
    var body = jsonEncode({
      'userId': userId,
      'kosakataId': kosakataId,
    });

    var response = await http.post(url, headers: headers, body: body);
    print(response.body);

    if (response.statusCode == 200) {
      print('data berhasil disimpan');
      return true;
    } else {
      print(response.statusCode);
      throw Exception("Gagal menyimpan data kosa kata");
    }
  }
}
