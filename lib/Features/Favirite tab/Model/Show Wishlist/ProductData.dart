/// id : 1
/// name : "Grokking Algorithms"
/// price : "250.00"
/// category : "Software"
/// image : "https://codingarabic.online/storage/product/UXbY3BvoHIQCuG6DqBK1dtfSKnpH67tUjwdr6ctT.png"
/// discount : 50
/// stock : 96
/// description : "<p>Grokking Algorithms is a fully illustrated, friendly guide that teaches you how to apply common algorithms to the practical problems you face every day as a programmer. You’ll start with sorting and searching and, as you build up your skills in thinking algorithmically, you’ll tackle more complex concerns such as data compression and artificial intelligence. Each carefully presented example includes helpful diagrams and fully annotated code samples in Python. Learning about algorithms doesn’t have to be boring! Get a sneak peek at the fun, illustrated, and friendly examples you’ll find in Grokking Algorithms on Manning Publications’ YouTube channel. Continue your journey into the world of algorithms with Algorithms in Motion, a practical, hands-on video course available exclusively at Manning.com (www.manning.com/livevideo/algorithms-​in-motion).</p>"
/// best_seller : 4

class ProductData {
  ProductData({
      this.id,
      this.name, 
      this.price, 
      this.category, 
      this.image, 
      this.discount, 
      this.stock, 
      this.description, 
      this.bestSeller,});

  ProductData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    category = json['category'];
    image = json['image'];
    discount = json['discount'];
    stock = json['stock'];
    description = json['description'];
    bestSeller = json['best_seller'];
  }
  int? id;
  String? name;
  String? price;
  String? category;
  String? image;
  int? discount;
  int? stock;
  String? description;
  int? bestSeller;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['price'] = price;
    map['category'] = category;
    map['image'] = image;
    map['discount'] = discount;
    map['stock'] = stock;
    map['description'] = description;
    map['best_seller'] = bestSeller;
    return map;
  }

}