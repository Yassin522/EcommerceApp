import 'package:ecommerce/Bindings/Seach_bindings.dart';
import 'package:ecommerce/Bindings/details_binding.dart';
import 'package:ecommerce/Bindings/orderdetailsBinding.dart';
import 'package:ecommerce/admin/Bindings/category_binding.dart';
import 'package:ecommerce/screens/Order/Oreders_screen.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/Bindings/home_binding.dart';
import 'package:ecommerce/Bindings/pofileBindings.dart';
import 'package:ecommerce/screens/details/details_screen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:ecommerce/screens/search/product_for_category.dart';
import 'package:get/get.dart';
import 'package:ecommerce/Bindings/signUp_bindings.dart';
import 'package:ecommerce/Bindings/sing_in_binding.dart';
import 'package:ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';

import '../Bindings/cart_binding.dart';
import '../admin/Bindings/add_product_bindings.dart';
import '../admin/Bindings/admin_home_bindings.dart';
import '../admin/Bindings/users_binding.dart';
import '../admin/screens/Users/users_screen.dart';
import '../admin/screens/home/components/special_offers.dart';
import '../admin/screens/add product/add_product_screen.dart';
import '../admin/screens/home/home_screen.dart';
import '../screens/login_success/login_success_screen.dart';
import '../screens/profile/components/User_information_screen.dart';

class AppPages {
  AppPages._();

  static const INITIAL = '/splash';
  static const signin = '/signIn';
  static const signup = '/singup';
  static const succse = '/succse';
  static const home = '/home';
  static const details = '/details';
  static const cart = '/cart';
  static const profile = '/profile';
  static const profileInfo = '/profileinfo';
  static const cateSearch = '/catesearch';
  static const orderdetails = '/orderdetails';
  //?**********Admin**********************
  static const adminhome = '/adminhome';
  static const adminusers = '/adminusers';
  static const admincategory = '/admincategory';
  static const adminaddproudct = '/adminaddproudct';

  static final routes = [
    GetPage(
      name: INITIAL,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: signin,
      page: () => SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: signup,
      page: () => SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: succse,
      page: () => LoginSuccessScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: details,
      page: () => DetailsScreen(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: cart,
      page: () => CartScreen(),
      binding: CartBinding(),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
      binding: ProfileBindings(),
    ),
    GetPage(
      name: profileInfo,
      page: () => UserProfileScreen(),
      binding: ProfileBindings(),
    ),
    GetPage(
      name: cateSearch,
      page: () => ProductsOfCategory(),
      binding: SearchBindings(),
    ),
    GetPage(
      name: orderdetails,
      page: () => OrdersScreen(),
      binding: OrderDetailsBinding(),
    ),

    //?************************Admin********************
    GetPage(
      name: adminhome,
      page: () => AdminHomeScreen(),
      binding: AdminHomeBindings(),
    ),
    GetPage(
      name: adminusers,
      page: () => UsersScreen(),
      binding: UsersBindings(),
    ),
     GetPage(
      name: admincategory,
      page: () => SpecialOffers(),
      binding: AdminCategoryBindings(),
     ),
    GetPage(
      name: adminaddproudct,
      page: () => AddProductScreen(),
      binding: AddProductBinding(),
    ),
  ];
}
