import 'package:ecommerce/admin/screens/home/components/category_controller.dart';
import 'package:get/instance_manager.dart';

import '../screens/home/home_controller.dart';

class AdminCategoryBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => AdminCategoryController());
  }
}
