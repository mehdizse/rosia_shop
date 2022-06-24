import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/views/widgets/text_util.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checked();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: controller.isChecked
                  ? Get.isDarkMode
                      ? const Icon(
                          Icons.check,
                          size: 30,
                          color: pinkClr,
                        )
                      : Image.asset("assets/check.png")
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtil(
                  text: "I accept",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
              const SizedBox(
                width: 3,
              ),
              TextUtil(
                  text: "terms & conditions",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.underline)
            ],
          )
        ],
      );
    });
  }
}
