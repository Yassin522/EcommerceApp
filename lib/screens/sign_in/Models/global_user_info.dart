import 'package:ecommerce/screens/sign_in/Models/user_addres_model.dart';
import 'package:ecommerce/screens/sign_in/Models/user_info.dart';

class GlobalUserInfo {
  static String? access_token;
  static String? token_type;
  static String? expires_in;
  static UserInfo? user;
  static List<UserAddressModel>? address;
}
