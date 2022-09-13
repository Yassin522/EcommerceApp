import 'package:ecommerce/models/Imagemode.dart';

class ProductColor {
  int? id;
  String? color;
  int? productId;
  List<ImageModel>? images;

  ProductColor(
      {this.id,
      this.color,
      this.productId,
      this.images});

  ProductColor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    color = json['color'];
    productId = json['product_id'];
    if (json['image'] != null) {
      images =  <ImageModel>[];
      json['image'].forEach((v) {
        images?.add( ImageModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['color'] = this.color;
    data['product_id'] = this.productId;
    if (this.images != null) {
      data['image'] = this.images?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

