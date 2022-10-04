import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';

import '../../models/Order.dart';
import '../../models/order_details.dart';
import '../sign_in/Models/global_user_info.dart';

class OrderService {
  String token = GlobalUserInfo.access_token!;

  getOrders(String id) async {
    try {
      var response = await http
          .get(Uri.parse(baseUrl + 'order/show?user_id=$id'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      var res = jsonDecode(response.body);
      print("allorders list ..");
      print(res);

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

  orderDetails(int id) async {
    try {
      var response = await http.get(
          Uri.parse(
            '${baseUrl}user/order/detail/show?order_id=$id',
          ),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      var res = jsonDecode(response.body);

      List allOrderdetails = res['data']
          .map(
            (item) => OrderDetail.fromJson(item),
          )
          .toList();

      return allOrderdetails;
    } catch (e) {
      print(e);

      return [];
    }
  }

  orderDetailsImages(int id) async {
    try {
      var response = await http.get(
          Uri.parse(
            '${baseUrl}user/product/color/show?id=$id',
          ),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      var res = jsonDecode(response.body);

      String image = res['data'][0]['image'][0]['image'];
      print('image');
      print(image);

      return image;
    } catch (e) {
      print(e);
      print("nooooo");

      return '';
    }
  }
}
