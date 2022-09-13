import 'dart:convert';

import 'package:ecommerce/screens/sign_in/Models/UserModel.dart';
import 'package:ecommerce/screens/sign_in/signIn_services.dart';
import 'package:ecommerce/screens/sign_up/models/signup_request_model.dart';
import 'package:ecommerce/screens/sign_up/models/signup_user_info.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/services_config.dart';

class SignUpServices {
  signUp(SignUpRequestModel user) async {
    try {
      print(user.toString());
      var response = await http.post(
          Uri.parse('${ServicesConfig.domainName}auth/register'),
          body: <String, dynamic>{
            'email': user.email,
            'password': user.password,
            'password_confirmation': user.password,
            'name_user': user.name_user,
            'name_market': user.name_market,
            'address': user.address,
            'number_phone': user.number_phone,
            'address': user.address,
            'city': user.city,
            'FCM': 'ok',
          });
      print('Body is ${response.body}');
      var body = jsonDecode(response.body);
      if (response.statusCode == 200) {
        var email = body['user']['email'];
        var loginservice = SignInServices();
        var loginUser = await loginservice.logIn(email, user.password!);
        return loginUser;
      } else {
        return null;
      }
    } catch (e) {
      print('wleeeeeeeeeeeee');
      print(e);
      return null;
    }
  }
}
