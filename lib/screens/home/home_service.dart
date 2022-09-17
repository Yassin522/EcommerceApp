import 'dart:convert';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:ecommerce/services_config.dart';
import 'package:http/http.dart' as http;
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/Product.dart';

import '../../models/category.dart';

class HomeService {
  var url = Uri.parse(baseUrl + 'category/show');
  var url2 = Uri.parse(baseUrl + 'product/show');
<<<<<<< HEAD
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY2MzQ0NDk2MCwiZXhwIjoxNjYzNDQ4NTYwLCJuYmYiOjE2NjM0NDQ5NjAsImp0aSI6Im8yeDlSZjZuZ2xqQmRCaEoiLCJzdWIiOjEsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.PNvHC1I8N-T6EpAgQBhMuo7_JQjtFoV4MLmFE-oQtaU';
=======
  String? token = GlobalUserInfo.access_token;
//'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY2MzE3MDA3OCwiZXhwIjoxNjYzMTczNjc4LCJuYmYiOjE2NjMxNzAwNzgsImp0aSI6IkpJYWpRYWF0Z1p6eVNLZFQiLCJzdWIiOjQsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.GcYjZdUpIkgtXRVrHYYXyw94dsxbzkje9XI03cH9G5g';
>>>>>>> 18a4f3bac29737ad615d71b4d40f8495d6eeb343
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
<<<<<<< HEAD

    return products;
=======

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
>>>>>>> 18a4f3bac29737ad615d71b4d40f8495d6eeb343
  }
}
