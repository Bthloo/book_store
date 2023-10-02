import 'User.dart';
import 'CartItems.dart';

/// id : 46
/// user : {"user_id":180,"user_name":"bthlooo"}
/// total : 346.7999999999997
/// cart_items : [{"item_id":157,"item_product_id":51,"item_product_name":"Mathematics for Machine Learning.2","item_product_image":"https://codingarabic.online/storage/product/EtjZkMB5Hd0C8LaO38deoxRlOeVKazBYfNHFGtgz.png","item_product_price":"279.00","item_product_discount":40,"item_product_price_after_discount":167.4,"item_product_stock":99,"item_quantity":1,"item_total":167.4},{"item_id":179,"item_product_id":2,"item_product_name":"Clean Code","item_product_image":"https://codingarabic.online/storage/product/MfwmbCtkbkP5Z1MCwTonoXFEOG8CXOrXe9SmDa7c.jpg","item_product_price":"299.00","item_product_discount":40,"item_product_price_after_discount":179.4,"item_product_stock":84,"item_quantity":1,"item_total":179.4}]

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
  num? total;
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