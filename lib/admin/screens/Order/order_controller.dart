import 'package:ecommerce/admin/screens/Order/order_service.dart';
import 'package:ecommerce/screens/Order/order_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminOrderController extends GetxController {
  AdminOrderService orderService = AdminOrderService();
  RxList orders = [].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    loadOrders();
    super.onInit();
  }

  loadOrders() async {
    print("getting orders admin....");
    orders.value = await orderService.getOrders();
    print(orders);
  }
}
