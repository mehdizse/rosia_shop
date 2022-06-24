import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Category Screen",
        style: TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white),
      ),
    );
  }
}
