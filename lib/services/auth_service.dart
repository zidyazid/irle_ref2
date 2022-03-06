// NOTE: FUNGSI DARI SERVICES ADALAH MENGHANDLE REQUEST DARI CLIENT KEPADA BACKEND
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:get_storage/get_storage.dart';
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

      GetStorage box = GetStorage();

      // var session = FlutterSession();
      // await session.set('id', user.id);
      // await session.set('name', user.name);
      // await session.set('email', user.email);
      //await session.set('username', user.username);
      //await session.set('profile_photo_url', user.profilePhotoUrl);
      // await session.set('token', user.token);

      box.write('name', user.name);
      box.write('id', user.id);
      box.write('email', user.email);
      box.write('token', user.token);

      print('data user : $box');

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

      GetStorage box = GetStorage();

      // var session = FlutterSession();
      // await session.set('id', user.id);
      // await session.set('name', user.name);
      // await session.set('email', user.email);
      //await session.set('username', user.username);
      //await session.set('profile_photo_url', user.profilePhotoUrl);
      // await session.set('token', user.token);

      box.write('name', user.name);
      box.write('id', user.id);
      box.write('email', user.email);
      box.write('token', user.token);

      print('data user : $box');
      // print('data user : ' + box.read('name'));
      return user;
    } else {
      print(response.request);
      throw Exception('Login gagal');
    }
  }
}
