import 'package:ecommerce/screens/Order/order_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/order_details.dart';
import '../sign_in/Models/global_user_info.dart';

class OrderController extends GetxController {
  OrderService orderService = OrderService();
  RxList orders = [].obs;

  var isLoading = true.obs;
  String iddd = '1';
  RxList orderdetails = [].obs;
  RxList allOrders = [].obs;

  @override
  void onInit() {
    loadOrders(iddd);
    super.onInit();
  }

  loadOrders(String id) async {
    print("getting orders ....");
    print(id);
    orders.value = await orderService.getOrders(id);
    print(orders);
  }

  getOrdersDetails(int id) async {
    orderdetails.value = await orderService.orderDetails(id);
    allOrders.value = [];

    for (var i = 0; i < orderdetails.length; i++) {
      String colorimage = await orderService
          .orderDetailsImages(orderdetails[i].product_color_id);
      print(colorimage);

      allOrders.add(OrderDetail(
          id: orderdetails[i].id,
          quantity: orderdetails[i].quantity,
          current_price: orderdetails[i].current_price,
          order_id: orderdetails[i].order_id,
          product_color_id: orderdetails[i].product_color_id,
          created_at: orderdetails[i].created_at,
          updated_at: orderdetails[i].updated_at,
          product_price_now: orderdetails[i].product_price_now,
          image: colorimage));
    }

    print(allOrders[0].id);
    print(allOrders[0].image);
  }
}
