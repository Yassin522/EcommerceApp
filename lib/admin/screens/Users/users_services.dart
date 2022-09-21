import 'dart:convert';

import 'package:ecommerce/admin/screens/Users/Models/user_model.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:ecommerce/services_config.dart';
import 'package:http/http.dart' as http;

class UsersServices {
  getUsers() async {
    try {
      var token = GlobalUserInfo.access_token;
      print(GlobalUserInfo.access_token.toString() +
          Uri.parse('${ServicesConfig.domainName}user/show').toString());
      var response = await http
          .get(Uri.parse('${ServicesConfig.domainName}user/show'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        print(response.body);
        var users = UserModel.fromJson(response.body);
        return users;
      } else {
        print(response.statusCode);
        print(response.body);
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeee');
      print(e);
    }
  }
}
