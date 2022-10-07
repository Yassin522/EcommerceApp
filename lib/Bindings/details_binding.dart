import 'package:ecommerce/admin/screens/edit%20product/edit_product_controller.dart';
import 'package:ecommerce/screens/details/details_controller.dart';
import 'package:ecommerce/screens/details/details_screen.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailController());
    Get.lazyPut(() => EditProductController());
  }
}
