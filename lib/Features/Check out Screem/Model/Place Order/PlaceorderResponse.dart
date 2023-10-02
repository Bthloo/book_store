import 'Data.dart';

/// data : {"id":51}
/// message : "Order Placed"
/// status : 201

class PlaceorderResponse {
  PlaceorderResponse({
      this.data, 
      this.message, 
      this.status,});

  PlaceorderResponse.fromJson(dynamic json) {
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