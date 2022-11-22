import 'dart:convert';

import 'package:ecommerce/models/total_cost.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../models/Cart.dart';

class CartService {
  String token = GlobalUserInfo.access_token!;

  addOrder(List<Cart> allProducts) async {
    try {
      Map<String, dynamic> data = {};
      String date = DateFormat("yyyy-MM-dd").format(DateTime.now());

      print(date);
      data.addAll({
        'date': date,
        'list_details': allProducts,
      });

      for (int i = 0; i < allProducts.length; i++) {
        data.addAll({
          'product_color_id': allProducts[i].product_id,
          'quantity': allProducts[i].numOfItem,
          'current_price': allProducts[i].price,
        });
      }
      var response = await http.post(
        Uri.parse(baseUrl + 'order/store'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data),
      );

      print(response.statusCode);
      print(response.body);
      var res = jsonDecode(response.body);
      print("rrrrrrrrrrrrrr");
      if (response.statusCode == 200) {
        return true;
      }
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  checkTotal() async {
    var url = Uri.parse(baseUrl + 'setting/cost/user');
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });
    Map<String, dynamic> json;

    var res = jsonDecode(response.body);
    var total = res['data'][0]['total_cost'];

    print("totalllllll");
    print(total);
    return total;
  }
}
