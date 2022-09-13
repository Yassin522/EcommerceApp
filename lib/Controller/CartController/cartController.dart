import 'package:get/state_manager.dart';
import 'package:ecommerce/models/Cart.dart';
import 'package:ecommerce/models/Product.dart';

class CartController extends GetxController {
  var cartItems = [
  /*  Cart(product: demoProducts[0], numOfItem: 2),
    Cart(product: demoProducts[1], numOfItem: 1),
    Cart(product: demoProducts[3], numOfItem: 1),*/
  ].obs;
  var totalPrice = 0.0.obs;
  GetTotalPrice() {
    totalPrice.value = 0.0;
    for (var i = 0; i < cartItems.length; i++) {
      totalPrice.value +=
          cartItems.value[i].product.price * cartItems[i].numOfItem;
    }
  }
}
