import 'package:get/state_manager.dart';
import 'package:ecommerce/models/Cart.dart';
import 'package:ecommerce/models/Product.dart';

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

  var cartservice = CartService();

  GetTotalPrice() {
    totalPrice.value = 0.0;
    for (var i = 0; i < myItems.length; i++) {
      totalPrice.value += myItems[i].price * myItems[i].numOfItem;
    }

    update();
  }

  addorder(List<Cart> allCart) async {
    ok.value = await cartservice.addOrder(allCart);
    print("tmmm");
    print(ok.value);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
