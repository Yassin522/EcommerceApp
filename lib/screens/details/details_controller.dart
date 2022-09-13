import 'package:ecommerce/models/Imagemode.dart';
import 'package:ecommerce/models/product_color.dart';
import 'package:ecommerce/screens/details/details_service.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/screens/home/home_service.dart';


class DetailController extends GetxController {
  HomeService homeService = HomeService();
  DetailService detailService = DetailService();
  RxList <ProductColor> productcolors = <ProductColor>[].obs;
  RxList <ImageModel> productImages = <ImageModel>[].obs;
 

  @override
  void onInit() {
    super.onInit();
  }

  loadProductColors(var id) async {
    print("getting products colors ....");
    productcolors.value = await detailService.getProductsColors(id);
    productImages.value=await detailService.getProductsImages(id);
  }
}
