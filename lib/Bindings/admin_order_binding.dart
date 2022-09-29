import 'package:ecommerce/admin/screens/Order/order_controller.dart';
import 'package:ecommerce/screens/cart/cartController.dart';
import 'package:get/get.dart';

class AdminOrderBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AdminOrderController());
  }
}
