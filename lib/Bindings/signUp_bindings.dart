import 'package:get/get.dart';

import '../screens/sign_up/controller/signUp_contoller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SignUpController());
  }
}
