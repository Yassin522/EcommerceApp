import 'package:ecommerce/models/Product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/screens/home/home_service.dart';

class AdminHomeController extends GetxController {
  HomeService homeService = HomeService();
  RxList productss = [].obs;
  RxList categories = [].obs;
  var isLoading = true.obs;
  var isLoading2 = true.obs;
  var isLoading3 = true.obs;

  @override
  void onInit() {
    loadCategories();
    loadProducts();
    super.onInit();
  }

  loadCategories() async {
    print("ccccccccccccc");
    categories.value = await homeService.getCategories();
  }

  loadProducts() async {
    print("getting products ....");
    productss.value = await homeService.getProducts();
  }

  logout() async {
    var result = await homeService.logout();
    return result;
  }
}
