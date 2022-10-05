import 'dart:convert';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';

import '../../../models/Order.dart';
import '../../../models/Order_admin.dart';
import '../../../models/order_details.dart';

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
            (item) => OrderAdmin.fromJson(item),
          )
          .toList();

      return allOrders;
    } catch (e) {
      print(e);

      return [];
    }
  }

  acceptOrder(int id) async {
    try {
      var respone = await http.post(
          Uri.parse(
            '${baseUrl}order/accept/$id',
          ),
          headers: {
            'Authorization': 'Bearer $token',
          },
          body: {
            'status': '1',
          });

      if (respone.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Wleeeeeeeeee');
      print(e);
      return false;
    }
  }

  deleteOrder(int id) async {
    try {
      var respone = await http.delete(
        Uri.parse(
          '${baseUrl}order/delete/admin/$id',
        ),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (respone.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Wleeeeeeeeee');
      print(e);
      return false;
    }
  }

  orderDetails(int id) async {
    try {
      var response = await http.get(
          Uri.parse(
            '${baseUrl}admin/order/detail/show?order_id=$id',
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
