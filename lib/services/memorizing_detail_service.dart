import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:irle_ref2/models/memorizing_detail_model.dart';

class MemorizingDetailService {
  String baseUrl = "http://192.168.43.18:8000/api";

  Future<List<MemorizingDetailModel>> getMemorizingDetail(int id) async {
    var url = "$baseUrl/memorizing-detail?id=$id";

    var headers = {'Content-Type': 'application/json'};
    var response = await http.get(url, headers: headers);

    print(response.body);

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
}
