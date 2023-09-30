import 'Data.dart';

/// data : {"sliders":[{"image":"https://codingarabic.online/storage/slider/UOtz83Ow0ChFQOZYeDp48yWreuvBYjRwb8BNUexc.jpg"},{"image":"https://codingarabic.online/storage/slider/GtwDnJtmovi7XHfCqBf3XyzejUGUo9fJ4kMpJNQ7.jpg"},{"image":"https://codingarabic.online/storage/slider/D0S7ph0nDeT3va8QssrbSp4qgwYlTxqTufoc8Vvv.jpg"}]}
/// message : ""
/// status : 200

class SliderResponse {
  SliderResponse({
      this.data, 
      this.message, 
      this.status,});

  SliderResponse.fromJson(dynamic json) {
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