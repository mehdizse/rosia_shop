import 'package:ecommerce_app/views/screens/category_screen.dart';
import 'package:ecommerce_app/views/screens/favorite_screen.dart';
import 'package:ecommerce_app/views/screens/home_screen.dart';
import 'package:ecommerce_app/views/screens/settings_screen.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;
  final tabs = const [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingsScreen(),
  ].obs;
  final title = const ["Rosia.Shop", "Category", "Favorite", "Settings"];
}
