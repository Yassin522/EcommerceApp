import 'package:ecommerce/screens/profile/Models/request_model.dart';
import 'package:ecommerce/screens/profile/components/profile_service.dart';
import 'package:ecommerce/screens/sign_in/Models/global_user_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var services = ProfileService();
  TextEditingController? user_nameCo = TextEditingController();
  TextEditingController? market_nameCo = TextEditingController();
  TextEditingController? phone_numberCo = TextEditingController();
  TextEditingController? addressCo = TextEditingController();
  TextEditingController? cityCo = TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    user_nameCo?.text = GlobalUserInfo.user!.name_user!;
    market_nameCo?.text = GlobalUserInfo.user!.name_market!;
    phone_numberCo?.text = GlobalUserInfo.user!.number_phone!;
    addressCo?.text = GlobalUserInfo.address![0].address!;
    cityCo?.text = GlobalUserInfo.address![0].city!;
  }

  updateProfile() async {
    var new_info = ProfileRequestModel(
      user_name: user_nameCo?.text,
      marken_name: market_nameCo?.text,
      phone_number: phone_numberCo?.text,
      address: addressCo?.text,
      city: cityCo?.text,
    );
    print(user_nameCo?.text);
    print(market_nameCo?.text);
    print(phone_numberCo?.text);
    print(addressCo?.text);
    print(cityCo?.text);

    var resulte = await services.updateProfile(new_info);

    if (resulte == true) {
      GlobalUserInfo.user!.name_user = user_nameCo?.text;
      GlobalUserInfo.user!.name_market = market_nameCo?.text;
      GlobalUserInfo.user!.number_phone = phone_numberCo?.text;
      GlobalUserInfo.address![0].address = addressCo?.text;
      GlobalUserInfo.address![0].city = cityCo?.text;
      update();
    }

    return resulte;
  }
}
