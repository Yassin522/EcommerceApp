class ImageModel {
  int? id;
  String? image;
  int? productColorId;

  ImageModel(
      {this.id,
      this.image,
      this.productColorId,
      });

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    productColorId = json['product_color_id'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['product_color_id'] = this.productColorId;
    return data;
  }
}