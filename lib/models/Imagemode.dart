class ImageModel {
  int? id;
  String? image;
  int? productColorId;
  String? name;

  ImageModel({this.id, this.image, this.productColorId, this.name});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    productColorId = json['product_color_id'];
    name = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['product_color_id'] = this.productColorId;
    data['color'] = this.name;
    return data;
  }
}
