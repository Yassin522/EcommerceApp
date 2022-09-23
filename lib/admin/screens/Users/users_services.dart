import 'dart:convert';

import 'package:ecommerce/admin/screens/Users/Models/user_model.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:ecommerce/services_config.dart';
import 'package:http/http.dart' as http;

class UsersServices {
  var token = GlobalUserInfo.access_token;
  getUsers() async {
    try {
      var response = await http
          .get(Uri.parse('${ServicesConfig.domainName}user/show'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (response.statusCode == 200) {
        var users = UsersModel.fromJson(response.body);
        return users;
      } else {
        print(response.statusCode);
        print(response.body);
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeee');
      print(e);
      return null;
    }
  }

  delteUser(String id) async {
    try {
      var response = await http.delete(
        Uri.parse('${ServicesConfig.domainName}admin/user/delete/$id'),
        headers: header(token!),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeeeeeeeee');
      print(e);
      return null;
    }
  }
}
