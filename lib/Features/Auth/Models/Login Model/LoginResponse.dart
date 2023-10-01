import 'Data.dart';

/// data : {"user":{"id":180,"name":"Basel Test1","email":"Bassel@test.com","address":null,"city":null,"phone":null,"email_verified":true,"image":"https://codingarabic.online/admin/assets/img/default/user.jpg"},"token":"932|A4bkdpEgIiXsWKe8haT5VHUWpRWcwVnutLlxZGml"}
/// message : "Logged in successfully!"
/// status : 200

class LoginResponse {
  LoginResponse({
      this.data, 
      this.message, 
      this.status,});

  LoginResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
  Data? data;
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}