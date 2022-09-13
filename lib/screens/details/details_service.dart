import 'dart:convert';
import 'package:ecommerce/models/Imagemode.dart';
import 'package:ecommerce/models/product_color.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';

import '../../models/category.dart';

class DetailService {

  String token =
'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY2MzA4ODg0NiwiZXhwIjoxNjYzMDkyNDQ2LCJuYmYiOjE2NjMwODg4NDYsImp0aSI6InRuWUljN3R0RVpwVTVWN3kiLCJzdWIiOjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.-FTI2dErkwaEDvTcXjvXb9Pt_vpp6GShVsrcZEfXT9E';
  
   getProductsColors(var id) async {
    var response = await http.get(Uri.parse(baseUrl + 'user/product/color/show?product_id=$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    print(baseUrl + 'user/product/color/show?product_id=$id');
    print(response.body);

    var res= jsonDecode(response.body);
    List productColors=res['data'].map(
      (item) => ProductColor.fromJson(item),
      
      ).toList();

      print(productColors);
      return productColors;
  }
  getProductsImages(var id) async {
    var response = await http.get(Uri.parse(baseUrl + 'user/product/color/show?product_id=$id'), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
     
     print("ggggggggggggggggggg");
    print(response.body);

    var res= jsonDecode(response.body);
    List productImages=res['data'].map(
      (item) => ImageModel.fromJson(item),
      
      ).toList();

      print(productImages);
      return productImages;
  }
}
