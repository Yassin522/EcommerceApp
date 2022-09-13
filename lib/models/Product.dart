import 'package:flutter/material.dart';


class Product {
  late int id;
 late String name;
 late String description;
late  List<String>  images;
late  String status;
late  String size;
late  int price;
late  int categoryId;

  Product(
      {
      required this.id,
      required this.name,
      required this.description,
      required this.images,
      required this.status,
      required this.size,
      required this.price,
      required this.categoryId,
      
      });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    images = json['image'];
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
    data['image'] = this.images;
    data['status'] = this.status;
    data['size'] = this.size;
    data['price'] = this.price;
    data['category_id'] = this.categoryId;
  
    return data;
  }
}


