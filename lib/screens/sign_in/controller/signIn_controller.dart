import 'package:get/state_manager.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:ecommerce/screens/sign_in/Models/user_info.dart';
import 'package:ecommerce/screens/sign_in/signIn_services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/UserModel.dart';

class SigninController extends GetxController {
  SignInServices service = SignInServices();
  String? email;
  String? password;

  UserModel? user;
  logIn() async {
    print(email);
    print(password);

    user = await service.logIn(email!, password!);
    print(user);

    if (user != null) {
      var box = GetStorage().write('role_id', user!.user!.role_id!);
      GlobalUserInfo.access_token = user!.access_token;
      GlobalUserInfo.token_type = user!.token_type;
      GlobalUserInfo.expires_in = user!.expires_in;
      GlobalUserInfo.user = user!.user;
      GlobalUserInfo.address = user!.address;
      return user;
    } else {
      return null;
    }
  }
}
