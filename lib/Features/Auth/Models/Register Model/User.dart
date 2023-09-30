/// id : 90
/// name : "Bassel"
/// email : "fdf@kf.comc"
/// address : null
/// city : null
/// phone : null
/// email_verified : false
/// image : "https://codingarabic.online/admin/assets/img/default/user.jpg"

class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.address, 
      this.city, 
      this.phone, 
      this.emailVerified, 
      this.image,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = json['address'];
    city = json['city'];
    phone = json['phone'];
    emailVerified = json['email_verified'];
    image = json['image'];
  }
  int? id;
  String? name;
  String? email;
  dynamic address;
  dynamic city;
  dynamic phone;
  bool? emailVerified;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['address'] = address;
    map['city'] = city;
    map['phone'] = phone;
    map['email_verified'] = emailVerified;
    map['image'] = image;
    return map;
  }

}