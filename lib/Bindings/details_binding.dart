import 'package:ecommerce/admin/screens/edit%20product/edit_product_controller.dart';
import 'package:ecommerce/screens/cart/cartController.dart';
import 'package:ecommerce/screens/details/details_controller.dart';
import 'package:ecommerce/screens/details/details_screen.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => DetailController());
    Get.lazyPut(() => EditProductController());
    if (GlobalUserInfo.user!.role_id == '2') {
      Get.lazyPut(() => CartController(), fenix: true);
    }
  }
}
