import 'User.dart';
import 'CartItems.dart';

/// id : 1
/// user : {"user_id":2,"user_name":"admin","address":null,"phone":null}
/// total : "130.51"
/// cart_items : [{"item_id":2,"item_product_id":2,"item_product_name":"doloremque","item_product_price":"421.00","item_quantity":1,"item_total":"130.51"}]

class Data {
  Data({
      this.id, 
      this.user, 
      this.total, 
      this.cartItems,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    total = json['total'];
    if (json['cart_items'] != null) {
      cartItems = [];
      json['cart_items'].forEach((v) {
        cartItems?.add(CartItems.fromJson(v));
      });
    }
  }
  int? id;
  User? user;
  String? total;
  List<CartItems>? cartItems;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['total'] = total;
    if (cartItems != null) {
      map['cart_items'] = cartItems?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}