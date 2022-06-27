import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/views/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/home/card_item.dart';
import '../widgets/home/search_form_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextUtil(
                        text: "Find Your",
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                    SizedBox(
                      height: 5,
                    ),
                    TextUtil(
                        text: "INSPIRATION",
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none),
                    SizedBox(
                      height: 20,
                    ),
                    SearchFormText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtil(
                    text: "Categories",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
            const CardItem(),
          ],
        ),
      ),
    );
  }
}
