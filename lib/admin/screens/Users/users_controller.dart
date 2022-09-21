import 'package:ecommerce/admin/screens/Users/users_services.dart';
import 'package:get/state_manager.dart';

class UsersController extends GetxController {
  var users = [];
  var service = UsersServices();
  getUsers() async {
    users = await service.getUsers();
  }
}
