class UserModel {
  int id;
  String namalengkap;
  String username;
  String password;

  userMap() {
    var mapping = Map<String, dynamic>();
    mapping['id'] = id;
    mapping['namalengkap'] = namalengkap;
    mapping['username'] = username;
    mapping['password'] = password;

    return mapping;
  }
}
