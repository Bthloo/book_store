import 'Data.dart';
import 'Errors.dart';

/// data : {"user":{"id":90,"name":"Bassel","email":"fdf@kf.comc","address":null,"city":null,"phone":null,"email_verified":false,"image":"https://codingarabic.online/admin/assets/img/default/user.jpg"},"token":"375|Ax4r9n0X9gY0ONOBAm1E6gkdpuULdRZinrycCU0e"}
/// message : "Successfully registered! Please verify your email."
/// errors : {"email":["The email has already been taken."]}
/// status : 201

class RegisterResponse {
  RegisterResponse({
      this.data, 
      this.message, 
      this.errors, 
      this.status,});

  RegisterResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
    status = json['status'];
  }
  Data? data;
  String? message;
  Errors? errors;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    if (errors != null) {
      map['errors'] = errors?.toJson();
    }
    map['status'] = status;
    return map;
  }

}