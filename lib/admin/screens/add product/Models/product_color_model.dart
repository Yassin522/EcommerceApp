// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class ProductColorModel {
  String? color;
  String? quantity;
  String? product_id;
  File? img_url;

  @override
  String tooString() {
    return 'ProductColorModel(color: $color, quantity: $quantity, product_id: $product_id, img_url: $img_url)';
  }
}
