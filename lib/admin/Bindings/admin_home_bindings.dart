import 'package:get/instance_manager.dart';

import '../screens/home/home_controller.dart';

class AdminHomeBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AdminHomeController());
  }
}
