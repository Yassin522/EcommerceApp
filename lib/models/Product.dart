import 'package:flutter/material.dart';

class Product {
  int? id;
  String? name;
  String? description;
  String? image;
  String? status;
  String? size;
  int? price;
  int? categoryId;

  Product({
    this.id,
    this.name,
    this.description,
    this.image,
    this.status,
    this.size,
    this.price,
    this.categoryId,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    size = json['size'];
    price = json['price'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['status'] = this.status;
    data['size'] = this.size;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;

    return data;
  }
}
