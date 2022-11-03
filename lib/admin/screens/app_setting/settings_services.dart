import 'dart:convert';

import 'package:ecommerce/admin/screens/app_setting/settings_model.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:ecommerce/services_config.dart';
import 'package:http/http.dart' as http;

class SettingServices {
  getSettings() async {
    print(GlobalUserInfo.user!.token.toString());
    try {
      var respone = await http.get(
        Uri.parse('${ServicesConfig.domainName}setting/index'),
        headers: header(GlobalUserInfo.access_token!),
      );
      if (respone.statusCode == 200) {
        var body = respone.body;
        var res = json.decode(body) as Map<String, dynamic>;
        print(res);
        return res;
      }
    } catch (e) {
      print('Wleeeeeeeeeeeeeee');
      print(e);
    }
  }

  updateSettings(SettingModel newSettings) async {
    try {
      var headers = {'Authorization': 'Bearer ${GlobalUserInfo.access_token}'};
      var request = http.MultipartRequest(
          'POST', Uri.parse(ServicesConfig.domainName + 'setting/update/1'));
      request.fields.addAll({'name': newSettings.name!});
      request.fields.addAll({'description': newSettings.description!});
      request.fields.addAll({'phone': newSettings.phone!});
      request.fields.addAll({'whatsapp': newSettings.whatsapp!});
      request.fields.addAll({'address': newSettings.address!});
      request.fields.addAll({'total_cost': newSettings.total_cost!});

      if (newSettings.image != null) {
        request.files.add(await http.MultipartFile.fromPath(
            'logo', newSettings.image!.path.toString()));
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
}
