class UserModel {
  // NOTE: VARIABLE YANG DIBUTUHKAN HARUS SERUPA DENGAN DARI API
  int id;
  String name;
  String email;
  String username;
  String profilePhotoUrl;
  String token;

  // NOTE: CONSTRUCTOR DARI VARIABLE
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.profilePhotoUrl,
      this.token});

  // NOTE: CONSTRUCTOR BILA DATA BERASAL DARI JSON
  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    email = json["email"];
    username = json["username"];
    profilePhotoUrl = json["profile_photo_url"];
    token = json["token"];
  }

  // NOTE: MENGUBAH USERMODEL MENJADI json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profile_photo_url': profilePhotoUrl,
      'token': token,
    };
  }
}
