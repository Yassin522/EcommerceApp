import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:ecommerce/screens/sign_in/Models/UserModel.dart';
import 'package:ecommerce/screens/sign_in/Models/user_info.dart';
import 'package:ecommerce/services_config.dart';

class SignInServices {
  logIn(
    String email,
    String password,
  ) async {
    try {
      print('${ServicesConfig.domainName}auth/login');
      var response = await http
          .post(Uri.parse('${ServicesConfig.domainName}auth/login'), body: {
        'email': email,
        'password': password,
      });
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var body = response.body;
        var user = UserModel.fromJson(body);
        return user;
      } else {
        return null;
      }
    } catch (e) {
      print('wleeeeeeeeeeee');
      print(e);
      return null;
    }
  }
}
