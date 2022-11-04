import 'package:ecommerce/admin/screens/app_setting/settings_controller.dart';
import 'package:get/get.dart';

class SettingBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingController());
  }
}
