import 'User.dart';

/// user : {"id":180,"name":"Basel Test1","email":"Bassel@test.com","address":null,"city":null,"phone":null,"email_verified":true,"image":"https://codingarabic.online/admin/assets/img/default/user.jpg"}
/// token : "932|A4bkdpEgIiXsWKe8haT5VHUWpRWcwVnutLlxZGml"

class Data {
  Data({
      this.user, 
      this.token,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}