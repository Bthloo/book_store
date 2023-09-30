import 'Sliders.dart';

/// sliders : [{"image":"https://codingarabic.online/storage/slider/UOtz83Ow0ChFQOZYeDp48yWreuvBYjRwb8BNUexc.jpg"},{"image":"https://codingarabic.online/storage/slider/GtwDnJtmovi7XHfCqBf3XyzejUGUo9fJ4kMpJNQ7.jpg"},{"image":"https://codingarabic.online/storage/slider/D0S7ph0nDeT3va8QssrbSp4qgwYlTxqTufoc8Vvv.jpg"}]

class Data {
  Data({
      this.sliders,});

  Data.fromJson(dynamic json) {
    if (json['sliders'] != null) {
      sliders = [];
      json['sliders'].forEach((v) {
        sliders?.add(Sliders.fromJson(v));
      });
    }
  }
  List<Sliders>? sliders;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (sliders != null) {
      map['sliders'] = sliders?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}