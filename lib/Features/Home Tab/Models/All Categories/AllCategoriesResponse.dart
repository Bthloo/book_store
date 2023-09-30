import 'Data.dart';

/// data : {"categories":[{"id":2,"name":"Software","products_count":29},{"id":3,"name":"DevOps","products_count":10},{"id":4,"name":"AI & Data Science","products_count":10}],"meta":{"total":3,"per_page":15,"current_page":1,"last_page":1},"links":{"first":"https://codingarabic.online/api/categories?page=1","last":"https://codingarabic.online/api/categories?page=1","prev":null,"next":null}}
/// message : ""
/// status : 200

class AllCategoriesResponse {
  AllCategoriesResponse({
      this.data, 
      this.message, 
      this.status,});

  AllCategoriesResponse.fromJson(dynamic json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }
  Data? data;
  String? message;
  int? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    map['status'] = status;
    return map;
  }

}