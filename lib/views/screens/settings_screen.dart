import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings Screen",
          style:
              TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white)),
    );
  }
}
