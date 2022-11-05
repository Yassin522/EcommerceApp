import 'package:ecommerce/admin/screens/Order/order_service.dart';
import 'package:ecommerce/models/order_details.dart';
import 'package:ecommerce/screens/Order/order_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AdminOrderController extends GetxController {
  AdminOrderService orderService = AdminOrderService();
  RxList orders = [].obs;
  RxList allOrders = [].obs;
  RxBool ok = true.obs;
  RxBool ok2 = true.obs;

  var isLoading = true.obs;

  RxList orderdetails = [].obs;

  @override
  void onInit() {
    loadOrders();
    super.onInit();
  }

  loadOrders() async {
    print("getting orders admin....");
    orders.value = await orderService.getOrders();
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
    print(allOrders[0].current_price);
    print("mnor");
    print(allOrders[0].product_price_now);
  }

  acceptorder(int id) async {
    ok.value = await orderService.acceptOrder(id);

    if (ok.value == true) {
      EasyLoading.showSuccess('تم قبول الطلب بنجاح');
    } else {
      EasyLoading.showError('حدث خطا في العملية');
    }
  }

  deleteorder(int id) async {
    ok2.value = await orderService.deleteOrder(id);

    if (ok2.value == true) {
      EasyLoading.showSuccess('تم حذف الطلب بنجاح');
    } else {
      EasyLoading.showError('حدث خطا في العملية');
    }
  }

  allorderdetails(int id) async {
    orderdetails.value = await orderService.orderDetails(id);
  }
}
