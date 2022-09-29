import 'package:ecommerce/admin/screens/edit%20product/edit_product_controller.dart';
import 'package:get/get.dart';

class EditProductBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => EditProductController());
  }
}
