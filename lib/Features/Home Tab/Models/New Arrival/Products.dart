/// id : 51
/// name : "Mathematics for Machine Learning.2"
/// description : "<p>The fundamental mathematical tools needed to understand machine learning include linear algebra, analytic geometry, matrix decompositions, vector calculus, optimization, probability and statistics. These topics are traditionally taught in disparate courses, making it hard for data science or computer science students, or professionals, to efficiently learn the mathematics.&nbsp;</p>"
/// price : "279.00"
/// discount : 40
/// price_after_discount : 167.4
/// stock : 99
/// best_seller : 1
/// image : "https://codingarabic.online/storage/product/EtjZkMB5Hd0C8LaO38deoxRlOeVKazBYfNHFGtgz.png"
/// category : "AI & Data Science"

class Products {
  Products({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.discount, 
      this.priceAfterDiscount, 
      this.stock, 
      this.bestSeller, 
      this.image, 
      this.category,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    discount = json['discount'];
    priceAfterDiscount = json['price_after_discount'];
    stock = json['stock'];
    bestSeller = json['best_seller'];
    image = json['image'];
    category = json['category'];
  }
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['discount'] = discount;
    map['price_after_discount'] = priceAfterDiscount;
    map['stock'] = stock;
    map['best_seller'] = bestSeller;
    map['image'] = image;
    map['category'] = category;
    return map;
  }

}