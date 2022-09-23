import 'dart:typed_data';

import 'package:ecommerce/admin/screens/home/home_service.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AdminHomeController extends GetxController {
  HomeAdminService homeService = HomeAdminService();
  RxList productss = [].obs;
  RxList categories = [].obs;
  var isLoading = true.obs;
  var isLoading2 = true.obs;
  var isLoading3 = true.obs;
  final categoryNameController = TextEditingController();
  Rx<Uint8List> image = Uint8List(0).obs;
  Rx<XFile> imagefile = XFile('nothing').obs;
  RxBool ok = true.obs;
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

  addcategory() async {
    ok.value = await homeService.addNewCategory(
        categoryNameController.text, imagefile.value);

        categoryNameController.clear();
       
    if (ok.value == true) {
      EasyLoading.showSuccess('تم اضافة النوع الجديد بنجاح');
    } else {
      EasyLoading.showError('حدث خطا في العملية');
    }
  }

  pickImage(ImageSource source) async {
    final ImagePicker _imagePicker = ImagePicker();

    XFile? _file = await _imagePicker.pickImage(source: source);
    imagefile.value = _file!;
    
    if (_file != null) {
      return _file;
    }
    update();
  }

  void selectImage() async {
    XFile im = await pickImage(ImageSource.gallery);

    imagefile.value = im;
    ok.value = false;
    print("fileeeeeeee");
    print(imagefile.value.path);
    update();
  }

  showSnackBar(String content, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
