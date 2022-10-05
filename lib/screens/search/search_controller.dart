import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/search/search_services.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  SearchServices services = SearchServices();
  var products = [];
  var id = '';
  getProductsFotCateegory() async {
    products = await services.getProductsForCategory(id);
    update();
  }
}
