import 'package:ecommerce_app/logic/controllers/main_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          backgroundColor: context.theme.backgroundColor,
          appBar: AppBar(
            elevation: 0,
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
            backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
            leading: Container(),
            actions: [
              IconButton(
                icon: Image.asset("assets/shop.png"),
                onPressed: () {},
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? pinkClr : mainColor,
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                    label: ''),
              ],
              onTap: (index) {
                controller.currentIndex.value = index;
              }),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: controller.tabs.value,
          ),
        );
      }),
    );
  }
}
