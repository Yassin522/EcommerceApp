import 'dart:io';

import 'package:ecommerce/admin/screens/app_setting/settings_model.dart';
import 'package:ecommerce/admin/screens/app_setting/settings_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/state_manager.dart';

class SettingController extends GetxController {
  SettingServices services = SettingServices();
  SettingModel newSettings = SettingModel();

  TextEditingController? name = TextEditingController();
  TextEditingController? description = TextEditingController();
  TextEditingController? phone = TextEditingController();
  TextEditingController? whatsapp = TextEditingController();
  TextEditingController? address = TextEditingController();
  TextEditingController? total_cost = TextEditingController();
  var image;

  File? chosenImage;

  updateImage(file) {
    chosenImage = File(file.path);
    print(file.path);
    update();
  }

  @override
  getSettings() async {
    var res = await services.getSettings();
    print(res['data'][0]['name']);
    return res;
  }

  void onInit() async {
    // TODO: implement onInit
    var settings = await getSettings();
    var info = settings['data'][0];
    name!.text = info['name'];
    description!.text = info['description'];
    phone!.text = info['phone'].toString();
    whatsapp!.text = info['whatsapp'];
    address!.text = info['address'];
    image = info['logo'];
    total_cost!.text = 0.toString();
    print(image);
    super.onInit();
  }

  getSettingsModel() {
    newSettings.name = name!.text;
    newSettings.description = description!.text;
    newSettings.phone = phone!.text;
    newSettings.whatsapp = whatsapp!.text;
    newSettings.address = address!.text;
    newSettings.total_cost = total_cost!.text;
    if (chosenImage != null) {
      newSettings.image = chosenImage;
    }
  }

  updateSettings() async {
    getSettingsModel();
    var res = await services.updateSettings(newSettings);
    return res;
  }
}
