import 'package:ecommerce/screens/cart/cartController.dart';
import 'package:ecommerce/screens/details/details_controller.dart';
import 'package:get/get.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
   
    Get.lazyPut(() => CartController(), fenix: true,);
  }
}
