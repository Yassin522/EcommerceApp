import 'package:ecommerce/models/Imagemode.dart';
import 'package:ecommerce/models/product_color.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/details/details_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/screens/home/home_service.dart';

class DetailController extends GetxController {
  HomeService homeService = HomeService();
  DetailService detailService = DetailService();
  RxList<ProductColor> productcolors = <ProductColor>[].obs;
  RxList productDetails = [].obs;
  RxList<ImageModel> productImages = <ImageModel>[].obs;
  var numbersofProducts = 0.obs;
  var initprice = 0.obs;
  var selectedImage = 0.obs;
  var ok = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loadProductColors(var id) async {
    productImages.value = [];
    print("getting products images ....");
    productDetails.value = await detailService.getProductsImages(id);

    for (var i = 0; i < productDetails.length; i++) {
      productImages.value.add(
        ImageModel(
          id: productDetails[i]['image'][0]['id'],
          productColorId: productDetails[i]['image'][0]['product_color_id'],
          image: productDetails[i]['image'][0]['image'],
        ),
      );
    }
    if (productImages.value.isNotEmpty) ok.value = true;
    print(productImages);
  }

  addCounter(int val) {
    numbersofProducts.value++;
    initprice.value += val;
  }

  minusCounter(int val) {
    numbersofProducts.value--;
    initprice.value -= val;
  }
}
