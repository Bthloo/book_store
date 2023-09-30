class OtbResponse {
  OtbResponse({
    required this.data,
    required this.message,
    required this.error,
    required this.status,
  });
  late final Data data;
  late final String message;
  late final List<dynamic> error;
  late final int status;

  OtbResponse.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    message = json['message'];
    error = List.castFrom<dynamic, dynamic>(json['error']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['message'] = message;
    _data['error'] = error;
    _data['status'] = status;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    this.address,
    this.city,
    this.phone,
    required this.emailVerified,
    required this.image,
  });
  late final int id;
  late final String name;
  late final String email;
  late final Null address;
  late final Null city;
  late final Null phone;
  late final bool emailVerified;
  late final String image;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    address = null;
    city = null;
    phone = null;
    emailVerified = json['email_verified'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['address'] = address;
    _data['city'] = city;
    _data['phone'] = phone;
    _data['email_verified'] = emailVerified;
    _data['image'] = image;
    return _data;
  }
}