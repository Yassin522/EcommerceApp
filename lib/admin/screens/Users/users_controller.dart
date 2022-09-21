import 'package:ecommerce/admin/screens/Users/Models/data.dart';
import 'package:ecommerce/admin/screens/Users/Models/user_model.dart';
import 'package:ecommerce/admin/screens/Users/users_services.dart';
import 'package:get/state_manager.dart';

class UsersController extends GetxController {
  List<UserData> users = [];
  var service = UsersServices();
  var oldPassword;
  var newPassword;
  getUsers() async {
    print('Wait');
    UsersModel res = await service.getUsers();
    users = res.data!;
  }

  deleteUser(String id, int index) async {
    var res = await service.delteUser(id);
    users.removeAt(index);
    update();
    return res;
  }
}
