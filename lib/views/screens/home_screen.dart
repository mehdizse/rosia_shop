import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Screen",
          style:
              TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white)),
    );
  }
}
