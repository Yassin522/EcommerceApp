import 'dart:convert';
import 'package:ecommerce/models/Imagemode.dart';
import 'package:ecommerce/models/product_color.dart';
import 'package:ecommerce/models/product_detail.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';

import '../../models/category.dart';
import '../../models/data.dart';

class DetailService {

  String token =
'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY2MzE3MDA3OCwiZXhwIjoxNjYzMTczNjc4LCJuYmYiOjE2NjMxNzAwNzgsImp0aSI6IkpJYWpRYWF0Z1p6eVNLZFQiLCJzdWIiOjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.GcYjZdUpIkgtXRVrHYYXyw94dsxbzkje9XI03cH9G5g';
  
   getProductsColors(var id) async {
    var response = await http.get(Uri.parse(baseUrl + 'user/product/color/show?product_id=$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
  

    var res= jsonDecode(response.body);
    List productColors=res['data'].map(
      (item) => ProductColor.fromJson(item),
      
      ).toList();
      
      return productColors;
  }
  getProductsImages(var id) async {
    var response = await http.get(Uri.parse(baseUrl + 'user/product/color/show?product_id=$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
     
    print("ggggggggggggggggggg");

    var res= jsonDecode(response.body);
    List productDetails=res['data'];
    
      return productDetails;
  }
}
