import 'Categories.dart';
import 'Meta.dart';
import 'Links.dart';

/// categories : [{"id":2,"name":"Software","products_count":29},{"id":3,"name":"DevOps","products_count":10},{"id":4,"name":"AI & Data Science","products_count":10}]
/// meta : {"total":3,"per_page":15,"current_page":1,"last_page":1}
/// links : {"first":"https://codingarabic.online/api/categories?page=1","last":"https://codingarabic.online/api/categories?page=1","prev":null,"next":null}

class Data {
  Data({
      this.categories, 
      this.meta, 
      this.links,});

  Data.fromJson(dynamic json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
  }
  List<Categories>? categories;
  Meta? meta;
  Links? links;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      map['meta'] = meta?.toJson();
    }
    if (links != null) {
      map['links'] = links?.toJson();
    }
    return map;
  }

}