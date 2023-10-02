/// item_id : 2
/// item_product_id : 2
/// item_product_name : "doloremque"
/// item_product_price : "421.00"
/// item_quantity : 1
/// item_total : "130.51"

class CartItems {
  CartItems({
      this.itemId, 
      this.itemProductId, 
      this.itemProductName, 
      this.itemProductPrice, 
      this.itemQuantity, 
      this.itemTotal,});

  CartItems.fromJson(dynamic json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductPrice = json['item_product_price'];
    itemQuantity = json['item_quantity'];
    itemTotal = json['item_total'];
  }
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductPrice;
  int? itemQuantity;
  String? itemTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = itemId;
    map['item_product_id'] = itemProductId;
    map['item_product_name'] = itemProductName;
    map['item_product_price'] = itemProductPrice;
    map['item_quantity'] = itemQuantity;
    map['item_total'] = itemTotal;
    return map;
  }

}