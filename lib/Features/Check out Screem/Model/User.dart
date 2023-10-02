/// user_id : 2
/// user_name : "admin"
/// address : null
/// phone : null

class User {
  User({
      this.userId, 
      this.userName, 
      this.address, 
      this.phone,});

  User.fromJson(dynamic json) {
    userId = json['user_id'];
    userName = json['user_name'];
    address = json['address'];
    phone = json['phone'];
  }
  int? userId;
  String? userName;
  dynamic address;
  dynamic phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_name'] = userName;
    map['address'] = address;
    map['phone'] = phone;
    return map;
  }

}