// NOTE: FUNGSI DARI SERVICES ADALAH MENGHANDLE REQUEST DARI CLIENT KEPADA BACKEND
import 'dart:convert';

import 'package:irle_ref2/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = "http://192.168.43.18:8000/api";

  Future<UserModel> register(
      {String name, String username, String email, String password}) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password
    });

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      print(response.body);
      return user;
    } else {
      throw Exception('Pendaftaran gagal');
    }
  }

  Future<UserModel> login({String email, String password}) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({'email': email, 'password': password});

    var response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      print(response.body);
      return user;
    } else {
      throw Exception('Login gagal');
    }
  }
}
