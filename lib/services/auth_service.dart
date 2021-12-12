import 'package:irle_ref2/models/user_model.dart';
import 'package:irle_ref2/repositories/repository.dart';

class AuthService {
  Repository _repository;

  AuthService() {
    _repository = Repository();
  }

  // kirim kan model sebagai parameter
  userRegistration(UserModel user) async {
    return await _repository.insertUserData('user', user.userMap());
    // return print(user.userMap());
  }

  getDataByUsername(userUsername) async {
    // int? index = 0;
    var username = await _repository.readDataByUsername('user', userUsername);
    print(username.length);
    if (username.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  userLoginAuth(userUsername, userPassword) async {
    // int? index = 0;
    var result = await _repository.readDataByUsername('user', userUsername);
    var password = await _repository.readDataByPassword('user', userPassword);
    print(result.length);
    if (result.length == 1) {
      if (password.length == 1) {
        return result;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }
}
