import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../models/Cart.dart';

class CartService {
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY2MzQzNjcxMSwiZXhwIjoxNjYzNDQwMzExLCJuYmYiOjE2NjM0MzY3MTEsImp0aSI6IndKUVVHa1M0QWhoQng0SnUiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.Zg8b-QHQY7sFfyz-6QPDBJ4vrmmti1wkdX0HOUwGT8s';

  addOrder(List<Cart> allProducts) async {
    try {
      Map<String, dynamic> data = {};
      String date = DateFormat("yyyy/MM/dd").format(DateTime.now());
      data.addAll({
        'date': date,
      });

      for (int i = 0; i < allProducts.length; i++) {
        data.addAll({
          'list_details[$i][product_color_id]': allProducts[i].product_id,
          'list_details[$i][quantity]': allProducts[i].numOfItem,
          'list_details[$i][current_price]': allProducts[i].price,
        });
      }

      print("first");
      print(data);
      print(jsonDecode(date));
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
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
