import 'dart:convert';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';

import '../../../models/Order.dart';

class AdminOrderService {
  var url = Uri.parse(baseUrl + 'order/show');
  String token = GlobalUserInfo.access_token!;

  getOrders() async {
    try {
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      var res = jsonDecode(response.body);
      print("eeeeeeeeeee");

      List allOrders = res['data']
          .map(
            (item) => Order.fromJson(item),
          )
          .toList();


      return allOrders;
    } catch (e) {
      print(e);
     
      return [];
    }
  }
}
