import 'package:get/state_manager.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';

class HomeController extends GetxController {
  var pageList = [
    HomeScreen(),
    CartScreen(),
  ].obs;
}
