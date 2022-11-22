import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/state_manager.dart';
import 'package:ecommerce/models/Cart.dart';
import 'package:ecommerce/models/Product.dart';

import '../../models/total_cost.dart';
import 'cart_screen.dart';
import 'cart_service.dart';

class CartController extends GetxController {
  var cartItems = [
    /*  Cart(product: demoProducts[0], numOfItem: 2),
    Cart(product: demoProducts[1], numOfItem: 1),
    Cart(product: demoProducts[3], numOfItem: 1),*/
  ].obs;
  var totalPrice = 0.0.obs;
  List<Cart> allitems = [];
  RxBool ok = false.obs;
  RxBool ok2 = false.obs;
  var total;
  var cartservice = CartService();

  GetTotalPrice() async {
    totalPrice.value = 0.0;
    for (var i = 0; i < myItems.length; i++) {
      totalPrice.value += myItems[i].price * myItems[i].numOfItem;
    }
    update();
  }

  removeItem(int index) {
    myItems.removeAt(index);
    update();
  }

  addorder(List<Cart> allCart) async {
    ok.value = await cartservice.addOrder(allCart);
    var total = await cartservice.checkTotal();

    print("yooooooooooooooo");
    print(ok.value);
    print(totalPrice.value);
    if (totalPrice.value <= total) {
      if (ok.value == true) {
        EasyLoading.showSuccess('تم ارسال الطلبية بنجاح');
      } else {
        EasyLoading.showError("حدث خطا بارسال الطلبية");
      }
    } else {
      EasyLoading.showError("سعر الطلبية كبير جداً");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
