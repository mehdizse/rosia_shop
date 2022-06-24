import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkMode';

  saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getDataThemeFromBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getDataThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changeTheme() {
    Get.changeThemeMode(
        getDataThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeDataInBox(!getDataThemeFromBox());
  }
}
