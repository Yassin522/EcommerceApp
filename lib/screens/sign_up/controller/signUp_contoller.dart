import 'package:get/state_manager.dart';
import 'package:ecommerce/screens/sign_in/Models/UserModel.dart';
import 'package:ecommerce/screens/sign_up/models/signup_request_model.dart';
import 'package:ecommerce/screens/sign_up/models/signup_user_info.dart';
import 'package:ecommerce/screens/sign_up/signUp_services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../sign_in/Models/global_user_info.dart';

class SignUpController extends GetxController {
  var service = SignUpServices();
  SignUpRequestModel? user = SignUpRequestModel();
  signUp() async {
    print(user.toString());

    var newUser = await service.signUp(user!);

    if (newUser == null) {
      return null;
    } else {
      var box = GetStorage().write('token', newUser!.access_token);
      GlobalUserInfo.access_token = newUser!.access_token;
      GlobalUserInfo.token_type = newUser!.token_type;
      GlobalUserInfo.expires_in = newUser!.expires_in;
      GlobalUserInfo.user = newUser!.user;
      GlobalUserInfo.address = newUser!.address;
      return newUser;
    }
  }
}
