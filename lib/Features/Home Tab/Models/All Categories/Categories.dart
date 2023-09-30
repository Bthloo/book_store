/// id : 2
/// name : "Software"
/// products_count : 29

class Categories {
  Categories({
      this.id, 
      this.name, 
      this.productsCount,});

  Categories.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    productsCount = json['products_count'];
  }
  int? id;
  String? name;
  int? productsCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['products_count'] = productsCount;
    return map;
  }

}