/// id : 1
/// governorate_name_ar : "القاهرة"
/// governorate_name_en : "Cairo"

class GovernorateData {
  GovernorateData({
      this.id, 
      this.governorateNameAr, 
      this.governorateNameEn,});

  GovernorateData.fromJson(dynamic json) {
    id = json['id'];
    governorateNameAr = json['governorate_name_ar'];
    governorateNameEn = json['governorate_name_en'];
  }
  int? id;
  String? governorateNameAr;
  String? governorateNameEn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['governorate_name_ar'] = governorateNameAr;
    map['governorate_name_en'] = governorateNameEn;
    return map;
  }

}