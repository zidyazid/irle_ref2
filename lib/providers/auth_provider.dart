import 'package:flutter/material.dart';
import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  // getter
  UserModel get user => _user;
  // setter
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  // cek apakah pendaftaran berhasil atau tidak
  Future<bool> register(
      {String name, String username, String email, String password}) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
