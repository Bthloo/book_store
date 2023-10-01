import 'Data.dart';

/// data : {"id":180,"name":"Basel Test1","email":"Bassel@test.com","address":null,"city":null,"phone":null,"email_verified":true,"image":"https://codingarabic.online/admin/assets/img/default/user.jpg"}
/// message : ""
/// status : 200

class ProfileResponse {
  ProfileResponse({
      this.data, 
      this.message, 
      this.status,});

  ProfileResponse.fromJson(dynamic json) {
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