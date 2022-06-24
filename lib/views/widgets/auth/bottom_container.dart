import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/views/widgets/text_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final String textType;

  const BottomContainer(
      {required this.text,
      required this.onPressed,
      required this.textType,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextUtil(
                  text: text,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none),
              TextButton(
                onPressed: onPressed,
                child: TextUtil(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  text: textType,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
