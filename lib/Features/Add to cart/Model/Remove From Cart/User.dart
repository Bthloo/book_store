/// user_id : 180
/// user_name : "bthlooo"

class User {
  User({
      this.userId, 
      this.userName,});

  User.fromJson(dynamic json) {
    userId = json['user_id'];
    userName = json['user_name'];
  }
  int? userId;
  String? userName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['user_name'] = userName;
    return map;
  }

}