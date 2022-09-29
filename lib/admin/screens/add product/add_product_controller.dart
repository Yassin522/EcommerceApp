import 'dart:io';

import 'package:ecommerce/admin/screens/add%20product/Models/AddPeoductModels.dart';
import 'package:ecommerce/admin/screens/add%20product/Models/product_color_model.dart';
import 'package:ecommerce/admin/screens/add%20product/add_product_services.dart';
import 'package:ecommerce/admin/screens/home/components/categories.dart';
import 'package:ecommerce/models/category.dart';
import 'package:ecommerce/screens/home/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class AddProductController extends GetxController {
  var homeServ = HomeService();
  var service = AddProductService();
  AddProductModel product = AddProductModel();
  ProductColorModel productColor = ProductColorModel();
  Category? chosenCategory;
  var categories = [];
  File? chosenImage;
  getCate() async {
    categories = await homeServ.getCategories();
    print(categories);
    chosenCategory = categories[0];
  }

  updateCate(Category value) {
    chosenCategory = value;
    update();
  }

  updateImage(file) {
    chosenImage = File(file.path);
    print(file.path);
    update();
  }

  addPoduct() async {
    product.category_id = chosenCategory!.id.toString();
    product.img_url = chosenImage;
    var res = await service.addProduct(product);
    if (productColor.color != null) {
      productColor.product_id = res;
      productColor.img_url = chosenImage;
      var colorRes = await service.addColor(productColor);
      if (colorRes == true) {
        return true;
      } else {
        return 'تمت إضافة المنتج من دون اضافة النكهة المحددة';
      }
    }
    return res;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getCate();
    chosenCategory = categories[0];
  }

  //?Edit product//

  TextEditingController name = TextEditingController();
}
