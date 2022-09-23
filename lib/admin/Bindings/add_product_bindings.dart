import 'package:ecommerce/admin/screens/add%20product/add_product_controller.dart';
import 'package:get/instance_manager.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AddProductController());
  }
}
