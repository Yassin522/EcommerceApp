import 'package:ecommerce/screens/profile/Models/request_model.dart';
import 'package:ecommerce/services_config.dart';
import 'package:http/http.dart' as http;

import '../../sign_in/Models/global_user_info.dart';

class ProfileService {
  var token = GlobalUserInfo.access_token;
  updateProfile(ProfileRequestModel user) async {
    try {
      var respone = await http.post(
          Uri.parse(
              '${ServicesConfig.domainName}user/update/${GlobalUserInfo.user!.id}'),
          body: {
            'name_user': user.user_name,
            'name_market': user.marken_name,
            'number_phone': user.phone_number,
            'address': user.address,
            'city': user.city,
          },
          headers: {
            'Authorization': 'Bearer $token',
          });

      if (respone.statusCode == 200)
        return true;
      else {
        return null;
      }
    } catch (e) {
      print('Wleeeeeeeeeeee');
      print(e);
      return null;
    }
  }
}
