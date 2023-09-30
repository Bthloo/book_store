/// email : ["The email has already been taken."]

class Errors {
  Errors({
      this.email,});

  Errors.fromJson(dynamic json) {
    email = json['email'] != null ? json['email'].cast<String>() : [];
  }
  List<String>? email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    return map;
  }

}