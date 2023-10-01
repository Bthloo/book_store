/// message : "Profile Updated Successfully"
/// status : 200

class UpdateResponse {
  UpdateResponse({
      this.message, 
      this.status,});

  UpdateResponse.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
  }
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}