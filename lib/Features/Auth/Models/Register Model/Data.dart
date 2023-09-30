import 'User.dart';

/// user : {"id":90,"name":"Bassel","email":"fdf@kf.comc","address":null,"city":null,"phone":null,"email_verified":false,"image":"https://codingarabic.online/admin/assets/img/default/user.jpg"}
/// token : "375|Ax4r9n0X9gY0ONOBAm1E6gkdpuULdRZinrycCU0e"

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