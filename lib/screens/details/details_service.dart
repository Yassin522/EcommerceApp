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
'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY2MzQzNjcxMSwiZXhwIjoxNjYzNDQwMzExLCJuYmYiOjE2NjM0MzY3MTEsImp0aSI6IndKUVVHa1M0QWhoQng0SnUiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Zg8b-QHQY7sFfyz-6QPDBJ4vrmmti1wkdX0HOUwGT8s';
  
   getProductsColors(var id) async {
    var response = await http.get(Uri.parse(baseUrl + 'user/product/color/show?product_id=$id'),
     headers: {
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
