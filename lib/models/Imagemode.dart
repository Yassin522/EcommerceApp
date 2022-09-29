class ImageModel {
  int? id;
  String? image;
  int? productColorId;
  String? name;
  int? quantity;

  ImageModel({this.id, this.image, this.productColorId, this.name, this.quantity});

  ImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    productColorId = json['product_color_id'];
    name = json['color'];
    quantity=json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['product_color_id'] = this.productColorId;
    data['color'] = this.name;
    data['quantity'] = this.quantity;
    return data;
  }
}
