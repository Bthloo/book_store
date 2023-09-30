/// image : "https://codingarabic.online/storage/slider/UOtz83Ow0ChFQOZYeDp48yWreuvBYjRwb8BNUexc.jpg"

class Sliders {
  Sliders({
      this.image,});

  Sliders.fromJson(dynamic json) {
    image = json['image'];
  }
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['image'] = image;
    return map;
  }

}