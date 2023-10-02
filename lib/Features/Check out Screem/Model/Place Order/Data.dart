/// id : 51

class Data {
  Data({
      this.id,});

  Data.fromJson(dynamic json) {
    id = json['id'];
  }
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    return map;
  }

}