/// item_id : 157
/// item_product_id : 51
/// item_product_name : "Mathematics for Machine Learning.2"
/// item_product_image : "https://codingarabic.online/storage/product/EtjZkMB5Hd0C8LaO38deoxRlOeVKazBYfNHFGtgz.png"
/// item_product_price : "279.00"
/// item_product_discount : 40
/// item_product_price_after_discount : 167.4
/// item_product_stock : 99
/// item_quantity : 1
/// item_total : 167.4

class CartItems {
  CartItems({
      this.itemId, 
      this.itemProductId, 
      this.itemProductName, 
      this.itemProductImage, 
      this.itemProductPrice, 
      this.itemProductDiscount, 
      this.itemProductPriceAfterDiscount, 
      this.itemProductStock, 
      this.itemQuantity, 
      this.itemTotal,});

  CartItems.fromJson(dynamic json) {
    itemId = json['item_id'];
    itemProductId = json['item_product_id'];
    itemProductName = json['item_product_name'];
    itemProductImage = json['item_product_image'];
    itemProductPrice = json['item_product_price'];
    itemProductDiscount = json['item_product_discount'];
    itemProductPriceAfterDiscount = json['item_product_price_after_discount'];
    itemProductStock = json['item_product_stock'];
    itemQuantity = json['item_quantity'];
    itemTotal = json['item_total'];
  }
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  int? itemProductDiscount;
  num? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  num? itemTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = itemId;
    map['item_product_id'] = itemProductId;
    map['item_product_name'] = itemProductName;
    map['item_product_image'] = itemProductImage;
    map['item_product_price'] = itemProductPrice;
    map['item_product_discount'] = itemProductDiscount;
    map['item_product_price_after_discount'] = itemProductPriceAfterDiscount;
    map['item_product_stock'] = itemProductStock;
    map['item_quantity'] = itemQuantity;
    map['item_total'] = itemTotal;
    return map;
  }

}