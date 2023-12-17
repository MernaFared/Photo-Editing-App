class ResultImageModel {
  String? imageUrl;

  ResultImageModel({this.imageUrl});

  ResultImageModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image_url'] = imageUrl;
    return data;
  }
}