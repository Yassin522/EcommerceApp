import 'package:ecommerce/Controller/CartController/HomeController/homeController.dart';
import 'package:ecommerce/screens/home/hpme_controller.dart';
import 'package:get/instance_manager.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }
}
