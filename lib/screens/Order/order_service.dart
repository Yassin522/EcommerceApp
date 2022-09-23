import 'dart:convert';
import 'package:ecommerce/models/data_2.dart';
import 'package:ecommerce/models/order_detail.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';

import '../sign_in/Models/global_user_info.dart';


class OrderService {
  var url = Uri.parse(baseUrl + 'order/show?user_id=${GlobalUserInfo.user!.id!}');
  String token = GlobalUserInfo.access_token!;

  getOrders(String id) async {

    try{
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var res = jsonDecode(response.body);
    print(res);
    List<Data2> allOrders=res['data']
        .map(
          (item) => Data2.fromJson(item),
        )
        .toList();
       
       print("allorders list ..");
       print(allOrders);
        return allOrders;

    }catch(e){
      print(e);
      return [];
    }
   
    
  }

}
