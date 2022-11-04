import 'dart:convert';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:ecommerce/services_config.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';
import 'package:image_picker/image_picker.dart';

import '../../../models/category.dart';

class HomeAdminService {
  var url = Uri.parse(baseUrl + 'category/show');
  var url2 = Uri.parse(baseUrl + 'product/show');
  String token = GlobalUserInfo.access_token!;
  // 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY2MzQ0NDk2MCwiZXhwIjoxNjYzNDQ4NTYwLCJuYmYiOjE2NjM0NDQ5NjAsImp0aSI6Im8yeDlSZjZuZ2xqQmRCaEoiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.PNvHC1I8N-T6EpAgQBhMuo7_JQjtFoV4MLmFE-oQtaU';

  getCategories() async {
    var response = await http.get(url, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var res = jsonDecode(response.body);
    List category = res['data']
        .map(
          (item) => Category.fromJson(item),
        )
        .toList();

    return category;
  }

  getProducts() async {
    var response = await http.get(url2, headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    var res = jsonDecode(response.body);
    List products = res['data']
        .map(
          (item) => Product.fromJson(item),
        )
        .toList();

    print(products);
    return products;
  }

  logout() async {
    try {
      var respone = await http.post(
          Uri.parse(
            '${ServicesConfig.domainName}auth/logout',
          ),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });
      if (respone.statusCode == 200) {
        return true;
      } else {
        print('Erro happen');
        print(respone.statusCode);
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeee');
      print(e);
      return null;
    }
  }

  addNewCategory(String categoryName, XFile selFile) async {
    var headers = {'Authorization': 'Bearer $token'};
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + 'category/store'));
    request.fields.addAll({'name': categoryName});
    request.files
        .add(await http.MultipartFile.fromPath('img_url', selFile.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print("tmmmmmmmmmmmmm");
      print(token);
      print(await response.stream.bytesToString());
      return true;
    } else {
      print(response.statusCode.toString());
      print("nooooooooooo");
      print(response.reasonPhrase);
      return false;
    }
  }

  deleteCategory(int id) async {
    try {
      var respone = await http.delete(
          Uri.parse(
            '${baseUrl}category/delete/$id',
          ),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (respone.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Wleeeeeeeeee');
      print(e);
      return false;
    }
  }
}
