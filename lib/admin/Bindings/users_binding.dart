import 'package:ecommerce/admin/screens/Users/users_controller.dart';
import 'package:get/get.dart';

class UsersBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => UsersController());
  }
}
