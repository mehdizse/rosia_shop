import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Favorite Screen",
          style:
              TextStyle(color: Get.isDarkMode ? Colors.black : Colors.white)),
    );
  }
}
