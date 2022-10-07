import 'dart:convert';

import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:ecommerce/services_config.dart';
import 'package:http/http.dart' as http;

class SearchServices {
  getProductsForCategory(String id) async {
    try {
      var token = GlobalUserInfo.access_token;
      print(Uri.parse(
          '${ServicesConfig.domainName}product/show?category_id=${id}'));

      var response = await http.get(
          Uri.parse(
              '${ServicesConfig.domainName}product/show?category_id=${id}'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body);
        List products = res['data']
            .map(
              (item) => Product.fromJson(item),
            )
            .toList();
        print('what we got is \\\\\\\\\\\\\\\\\\');
        products.forEach((element) {
          print(element);
        });
        return products;
      } else {
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeeeeeeeeee');
      print(e);
      return null;
    }
  }
}
