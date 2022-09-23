
import 'package:ecommerce/screens/Order/order_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../sign_in/Models/global_user_info.dart';


class OrderController extends GetxController {
  OrderService orderService = OrderService();
  RxList orders = [].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    loadOrders(GlobalUserInfo.user!.id!);
    super.onInit();
  }

  loadOrders(String id) async {
    print("getting orders ....");
    orders.value = await orderService.getOrders(id);
  }

}
