import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../screens/profile/profile_controller.dart';

class ProfileBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ProfileController());
  }
}
