import 'dart:convert';

import 'package:ecommerce/admin/screens/add%20product/Models/product_color_model.dart';
import 'package:ecommerce/admin/screens/edit%20product/update_product_model.dart';
import 'package:ecommerce/constants.dart';
import 'package:http/http.dart' as http;

import '../../../screens/sign_in/Models/global_user_info.dart';
import '../../../services_config.dart';

class EditProductServices {
  updateProduct(UpdateProductModel product) async {
    try {
      var headers = {'Authorization': 'Bearer ${GlobalUserInfo.access_token}'};
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(ServicesConfig.domainName +
              'product/update/${product.product_id}'));
      request.fields.addAll({'name': product.name!});
      request.fields.addAll({'description': product.description!});
      request.fields.addAll({'size': product.size!});
      if (product.status == 'متوافر') {
        request.fields.addAll({'status': '1'});
      } else {
        request.fields.addAll({'status': '0'});
      }
      request.fields.addAll({'price': product.price.toString()});
      request.fields.addAll({'category_id': product.category_id!});

      if (product.img_url != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'img_url', product.img_url!.path.toString()));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
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

  deleteProduct(String id) async {
    try {
      var headers = {'Authorization': 'Bearer ${GlobalUserInfo.access_token}'};
      var respone = await http.delete(
        Uri.parse(ServicesConfig.domainName + 'product/delete/$id'),
        headers: headers,
      );
      if (respone.statusCode == 200) {
        return true;
      } else {
        print(respone.statusCode);
        return null;
      }
    } catch (e) {
      catchPrint(e);
    }
  }

  addNewColor(ProductColorModel color) async {
    try {
      var headers = header(GlobalUserInfo.access_token.toString());
      var request = http.MultipartRequest(
          'POST', Uri.parse(ServicesConfig.domainName + 'product/color/store'));
      request.fields.addAll({'color': color.color!});
      request.fields.addAll({'quantity': color.quantity!});
      request.fields.addAll({'product_id': color.product_id!});
      if (color.img_url != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'img_url', color.img_url!.path.toString()));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        print('oooooooooooooooooooooooooo');
        print(response.statusCode);
        print(await response.stream.bytesToString());
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeeeeeeee');
      print(e);
      return null;
    }
  }

  deleteColor(String id) async {
    try {
      var headers = {'Authorization': 'Bearer ${GlobalUserInfo.access_token}'};
      var respone = await http.delete(
          Uri.parse('${ServicesConfig.domainName}product/color/delete/$id'),
          headers: headers);

      if (respone.statusCode == 200) {
        return true;
      } else {
        print(respone.statusCode);
        print('ooooooooooooooooo');
        return null;
      }
    } catch (e) {
      print('wleeeeeeeeeeeeeeeee');
      print(e);
      return null;
    }
  }

  updateColor(ProductColorModel color) async {
    try {
      var headers = header(GlobalUserInfo.access_token.toString());
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(ServicesConfig.domainName +
              'product/color/update/${color.product_id}'));
      request.fields.addAll({'color': color.color!});
      request.fields.addAll({'quantity': color.quantity!});
      request.fields.addAll({'product_id': color.product_id!});
      if (color.img_url != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'img_url', color.img_url!.path.toString()));
      }

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        print('oooooooooooooooooooooooooo');
        print(response.statusCode);
        print(await response.stream.bytesToString());
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeeeeeeee');
      print(e);
      return null;
    }
  }
}
