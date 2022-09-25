import 'dart:convert';
import 'package:ecommerce/models/order_detail.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';

import '../../models/Order.dart';
import '../sign_in/Models/global_user_info.dart';

class OrderService {
  var url = Uri.parse(baseUrl + 'order/show?user_id=1');
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY2NDEwNzM5MywiZXhwIjoxNjY0MTEwOTkzLCJuYmYiOjE2NjQxMDczOTMsImp0aSI6IlBUYXVGOFdGUFNvWDhMNkQiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.mDj8GxrKWJVYodYBu68uATIKSi6jUryTDDk05gPsFNg';

  getOrders(String id) async {
    try {
      var response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      var res = jsonDecode(response.body);

      List allOrders = res['data']
          .map(
            (item) => Order.fromJson(item),
          )
          .toList();

      print("allorders list ..");

      return allOrders;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
