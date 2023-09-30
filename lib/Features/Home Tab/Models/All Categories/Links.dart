/// first : "https://codingarabic.online/api/categories?page=1"
/// last : "https://codingarabic.online/api/categories?page=1"
/// prev : null
/// next : null

class Links {
  Links({
      this.first, 
      this.last, 
      this.prev, 
      this.next,});

  Links.fromJson(dynamic json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }
  String? first;
  String? last;
  dynamic prev;
  dynamic next;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first'] = first;
    map['last'] = last;
    map['prev'] = prev;
    map['next'] = next;
    return map;
  }

}