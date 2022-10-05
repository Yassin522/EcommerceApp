import 'dart:convert';

import 'package:flutter/foundation.dart';

class OrderDetail {
  int? id;
  int? quantity;
  int? current_price;
  int? order_id;
  int? product_color_id;
  String? created_at;
  String? updated_at;
  int? product_price_now;
  String? image;

  OrderDetail({
    required this.id,
    required this.quantity,
    required this.current_price,
    required this.order_id,
    required this.product_color_id,
    required this.created_at,
    required this.updated_at,
    required this.product_price_now,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'quantity': quantity,
      'current_price': current_price,
      'order_id': order_id,
      'product_color_id': product_color_id,
      'created_at': created_at,
      'updated_at': updated_at,
      'product_price_now': product_price_now,
    };
  }

  OrderDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    current_price = json['current_price'];
    order_id = json['order_id'];
    product_color_id = json['product_color_id'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
    product_price_now = json['product_price_now'];
  }
}
