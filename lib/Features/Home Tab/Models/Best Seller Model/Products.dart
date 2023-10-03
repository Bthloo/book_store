/// id : 49
/// name : "Data Science from Scratch.2"
/// description : "<p>To really learn data science, you should not only master the tools—data science libraries, frameworks, modules, and toolkits—but also understand the ideas and principles underlying them. Updated for Python 3.6, this second edition of Data Science from Scratch shows you how these tools and algorithms work by implementing them from scratch.</p>"
/// price : "279.00"
/// discount : 50
/// price_after_discount : 139.5
/// stock : 84
/// best_seller : 16
/// image : "https://codingarabic.online/storage/product/5CUVpDxJU33HCGJhta9DHQnPtht5NJF7j1C7CyHk.jpg"
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
  num? discount;
  num? priceAfterDiscount;
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