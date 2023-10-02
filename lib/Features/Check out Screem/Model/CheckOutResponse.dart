import 'Data.dart';

/// data : {"id":1,"user":{"user_id":2,"user_name":"admin","address":null,"phone":null},"total":"130.51","cart_items":[{"item_id":2,"item_product_id":2,"item_product_name":"doloremque","item_product_price":"421.00","item_quantity":1,"item_total":"130.51"}]}
/// message : "Checkout"
/// status : 200

class CheckOutResponse {
  CheckOutResponse({
      this.data, 
      this.message, 
      this.status,});

  CheckOutResponse.fromJson(dynamic json) {
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