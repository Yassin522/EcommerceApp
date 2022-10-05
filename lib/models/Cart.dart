import 'package:flutter/material.dart';

import 'Product.dart';
import 'Product.dart';

class Cart {
 
   int numOfItem;
   String name;
   int price;
   int product_id;
   String image;

  Cart({
   
     required this.numOfItem,
     required this.name,
     required this.price,
     required this.product_id,
     required this.image,
     });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["quantity"] = this.numOfItem;
    data["current_price"] = this.price;
    data["product_color_id"] = this.product_id;
    return data;
  }
}

// Demo data for our cart


