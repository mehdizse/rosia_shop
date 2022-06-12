import 'package:ecommerce_app/logic/bindings/auth_binding.dart';
import 'package:ecommerce_app/views/screens/auth/forget_password_screen.dart';
import 'package:ecommerce_app/views/screens/auth/login_screen.dart';
import 'package:ecommerce_app/views/screens/auth/register_screen.dart';
import 'package:ecommerce_app/views/screens/welcome_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const initalRoute = Routes.welcomePage;

  static final routes = [
    GetPage(name: Routes.welcomePage, page: () => const WelcomeScreen()),
    GetPage(
        name: Routes.loginPage,
        page: () => LoginScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.registerPage,
        page: () => const RegisterScreen(),
        binding: AuthBinding()),
    GetPage(
        name: Routes.forgetPasswordPage,
        page: () => const ForgetPasswordScreen(),
        binding: AuthBinding()),
  ];
}

class Routes {
  static const welcomePage = "/WelcomePage";
  static const loginPage = "/LoginPage";
  static const registerPage = "/RegisterPage";
  static const forgetPasswordPage = "/forgetPasswordPage";
}
