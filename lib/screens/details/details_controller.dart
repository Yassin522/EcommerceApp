import 'package:ecommerce/models/Imagemode.dart';
import 'package:ecommerce/models/product_color.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/screens/details/details_service.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/screens/home/home_service.dart';

class DetailController extends GetxController {
  HomeService homeService = HomeService();
  DetailService detailService = DetailService();
  RxList<ProductColor> productcolors = <ProductColor>[].obs;
  RxList productDetails = [].obs;
  RxList productColorsAdmin = [].obs;
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
    if(GlobalUserInfo.user!.role_id=='1'){
      productColorsAdmin.value=await detailService.getProductsColorsAdmin(id);
    }
if(GlobalUserInfo.user!.role_id=='1'){
for (var i = 0; i < productDetails.length; i++) {
      productImages.value.add(
        ImageModel(
          id: productDetails[i]['image'][0]['id'],
          productColorId: productDetails[i]['image'][0]['product_color_id'],
          image: productDetails[i]['image'][0]['image'],
          name: productDetails[i]['color'],
          quantity: productColorsAdmin[i]['quantity'],

        ),
      );
    }
}else{
    for (var i = 0; i < productDetails.length; i++) {
      productImages.value.add(
        ImageModel(
          id: productDetails[i]['image'][0]['id'],
          productColorId: productDetails[i]['image'][0]['product_color_id'],
          image: productDetails[i]['image'][0]['image'],
          name: productDetails[i]['color'],
        ),
      );
    }
}
    if (productImages.value.isNotEmpty)
     ok.value = true;
  
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
