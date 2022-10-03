import 'dart:io';

import 'package:ecommerce/admin/screens/add%20product/Models/AddPeoductModels.dart';
import 'package:ecommerce/admin/screens/edit%20product/edit_services.dart';
import 'package:ecommerce/admin/screens/edit%20product/update_product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../models/Product.dart';
import '../../../models/category.dart';
import '../../../screens/home/home_service.dart';
import '../add product/Models/product_color_model.dart';

class EditProductController extends GetxController {
  var homeServ = HomeService();
  var editServ = EditProductServices();
  Category? chosenCategory;
  var categories = [];
  File? chosenImage;
  Product newPro = Product();
  ProductColorModel productModel = ProductColorModel();
  var image;
  var colrImage;
  String? status = 'غير متوافر';
  TextEditingController? name = TextEditingController(text: ' ');
  TextEditingController? description = TextEditingController();
  TextEditingController? price = TextEditingController();
  TextEditingController? size = TextEditingController();
  TextEditingController? quantity = TextEditingController();
  TextEditingController? color = TextEditingController();
  bool isEdit = false;
  getCate() async {
    categories = await homeServ.getCategories();
    print(categories);
    chosenCategory = categories[0];
  }

  updateStatus(String value) {
    status = value;
    update();
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

  updateColorImage(file) {
    colrImage = File(file.path);
    print(file.path);
    update();
  }

  editColorImage(file) {
    colrImage = File(file.path);
    isEdit = false;
    print(file.path);
    update();
  }

  updateProduct() async {
    var product = getNewProduct();
    var res = await editServ.updateProduct(product);
    return res;
  }

  getNewProduct() {
    var newProduct = UpdateProductModel();
    newProduct.name = name!.text;
    newProduct.description = description!.text;
    newProduct.price = price!.text;
    newProduct.size = size!.text;
    newProduct.status = status;
    newProduct.category_id = chosenCategory!.id.toString();
    if (chosenImage != null) {
      newProduct.img_url = chosenImage;
    }
    newProduct.product_id = newPro.id.toString();
    return newProduct;
  }

  takeNewProduct() {
    image = newPro.image;
    name?.text = newPro.name!.toString();
    print('/*/*/*/*/*/*/*/*/*/*/*/*/');
    print(newPro.description);
    description?.text = newPro.description!;
    price?.text = newPro.price.toString();
    size?.text = newPro.size!;
  }

  deleteProduct(String id) async {
    var res = await editServ.deleteProduct(id);
    return res;
  }

  addNewcolor(String id) async {
    ProductColorModel newColor = ProductColorModel();
    newColor.color = color?.text;
    newColor.img_url = colrImage;
    newColor.product_id = id;
    newColor.quantity = quantity?.text;
    print(newColor.tooString());
    var res = await editServ.addNewColor(newColor);

    return res;
  }

  updateColor(String id) async {
    ProductColorModel newColor = ProductColorModel();
    newColor.color = color?.text;
    if (colrImage is File) newColor.img_url = colrImage;
    newColor.product_id = id;
    newColor.quantity = quantity?.text;
    print(newColor.tooString());
    var res = await editServ.updateColor(newColor);

    return res;
  }

  takeColor(ProductColorModel newColor) {
    print(newColor.color);
    print(newColor.quantity);
    color?.text = newColor.color!;
    quantity?.text = newColor.quantity!;
  }

  deleteColor(String id) async {
    var res = editServ.deleteColor(id);
    return res;
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getCate();
    chosenCategory = categories[0];
    takeNewProduct();
  }
}
