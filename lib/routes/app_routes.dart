import 'package:ecommerce/Bindings/details_binding.dart';
import 'package:ecommerce/screens/cart/cart_screen.dart';
import 'package:ecommerce/Bindings/home_binding.dart';
import 'package:ecommerce/screens/details/details_screen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:get/get.dart';
import 'package:ecommerce/Bindings/signUp_bindings.dart';
import 'package:ecommerce/Bindings/sing_in_binding.dart';
import 'package:ecommerce/screens/sign_in/sign_in_screen.dart';
import 'package:ecommerce/screens/sign_up/sign_up_screen.dart';
import 'package:ecommerce/screens/splash/splash_screen.dart';

import '../Bindings/cart_binding.dart';
import '../screens/login_success/login_success_screen.dart';

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
      binding: DetailsBinding(),
    ),
  ];
}
