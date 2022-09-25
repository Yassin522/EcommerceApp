import 'dart:convert';

import 'package:ecommerce/admin/screens/add%20product/Models/AddPeoductModels.dart';
import 'package:ecommerce/admin/screens/add%20product/Models/product_color_model.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:ecommerce/services_config.dart';
import 'package:http/http.dart' as http;

class AddProductService {
  addProduct(AddProductModel product) async {
    try {
      var headers = {'Authorization': 'Bearer ${GlobalUserInfo.access_token}'};
      var request = http.MultipartRequest(
          'POST', Uri.parse(ServicesConfig.domainName + 'product/store'));
      request.fields.addAll({'name': product.name!});
      request.fields.addAll({'description': product.description!});
      request.fields.addAll({'size': product.size!});
      request.fields.addAll({'status': '!'});
      request.fields.addAll({'price': product.price.toString()});
      request.fields.addAll({'category_id': product.category_id!});

      if (product.img_url != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'img_url', product.img_url!.path.toString()));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print(res);

        var js = jsonDecode(res) as Map<String, dynamic>;
        print('Id is ::::::::::::  ' + js['product']['id'].toString());
        return js['product']['id'].toString();
      } else {
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeeeeeeee');
      print(e);
      return null;
    }
  }

  addColor(ProductColorModel color) async {
    try {
      var headers = {'Authorization': 'Bearer ${GlobalUserInfo.access_token}'};
      var request = http.MultipartRequest(
          'POST', Uri.parse(ServicesConfig.domainName + 'product/color/store'));
      request.fields.addAll({'color': color.color!});
      request.fields.addAll({'quantity': color.quantity.toString()});
      request.fields.addAll({'product_id': color.product_id!});
      if (color.image != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'img_url', color.image!.path.toString()));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var res = await response.stream.bytesToString();
        print(res);
        return true;
      } else {
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeeeeeeee');
      print(e);
      return null;
    }
  }
}
