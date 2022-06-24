import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:ecommerce_app/logic/controllers/theme_mode_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                ThemeController().changeTheme();
              },
              child: Text("Dark Mode",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black)),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(builder: (controller) {
              return TextButton(
                onPressed: () {
                  Get.defaultDialog(
                      title: "Logout From App",
                      titleStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      middleText: "Are you sure you need to logout",
                      middleTextStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      radius: 10,
                      textCancel: "No",
                      cancelTextColor: Colors.black,
                      textConfirm: "Yes",
                      confirmTextColor: Colors.black,
                      onCancel: () {
                        Get.back();
                      },
                      onConfirm: () {
                        controller.logout();
                      },
                      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                      backgroundColor: Colors.grey);

                  // ;
                },
                child: Text("Logout",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black)),
              );
            }),
          ],
        ),
      ),
    );
  }
}
