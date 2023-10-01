/// id : 1
/// name : "Grokking Algorithms"
/// description : "<p>Grokking Algorithms is a fully illustrated, friendly guide that teaches you how to apply common algorithms to the practical problems you face every day as a programmer. You’ll start with sorting and searching and, as you build up your skills in thinking algorithmically, you’ll tackle more complex concerns such as data compression and artificial intelligence. Each carefully presented example includes helpful diagrams and fully annotated code samples in Python. Learning about algorithms doesn’t have to be boring! Get a sneak peek at the fun, illustrated, and friendly examples you’ll find in Grokking Algorithms on Manning Publications’ YouTube channel. Continue your journey into the world of algorithms with Algorithms in Motion, a practical, hands-on video course available exclusively at Manning.com (www.manning.com/livevideo/algorithms-​in-motion).</p>"
/// price : "250.00"
/// discount : 50
/// price_after_discount : 125
/// stock : 96
/// best_seller : 4
/// image : "https://codingarabic.online/storage/product/UXbY3BvoHIQCuG6DqBK1dtfSKnpH67tUjwdr6ctT.png"
/// category : "Software"

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