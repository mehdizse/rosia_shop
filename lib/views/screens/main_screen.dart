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
          appBar: AppBar(
            elevation: 0,
            title: Text(controller.title[controller.currentIndex.value]),
            centerTitle: true,
            backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
            leading: Container(),
            actions: [
              IconButton(
                icon: Image.asset("assets/shop.png"),
                onPressed: () {},
              ),
            ],
          ),
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
              currentIndex: controller.currentIndex.value,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? mainColor : pinkClr,
                    ),
                    icon: Icon(
                      Icons.home,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? mainColor : pinkClr,
                    ),
                    icon: Icon(
                      Icons.category,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? mainColor : pinkClr,
                    ),
                    icon: Icon(
                      Icons.favorite,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? mainColor : pinkClr,
                    ),
                    icon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
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
