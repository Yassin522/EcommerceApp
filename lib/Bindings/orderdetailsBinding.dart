
import 'package:get/instance_manager.dart';

import '../screens/Order/Oreders_screen.dart';

class OrderDetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => OrdersScreen());
  }
}
