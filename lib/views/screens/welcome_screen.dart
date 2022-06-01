import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/views/widgets/text_util.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset("assets/background.png", fit: BoxFit.cover)),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                height: 60,
                width: 190,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: TextUtil(
                    text: "Welcome",
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                width: 230,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextUtil(
                      text: "Rosia",
                      color: mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    TextUtil(
                      text: "Shop",
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 250,
              ),
              ElevatedButton(
                onPressed: () {
                  Get.offNamed(Routes.loginPage);
                },
                style: ElevatedButton.styleFrom(
                  primary: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                ),
                child: const TextUtil(
                  text: 'Get Started',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: 22.0,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextUtil(
                      text: "Don't have an account ?",
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none),
                  const SizedBox(
                    width: 3,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offNamed("/RegisterPage");
                    },
                    child: const TextUtil(
                        text: "Sign Up",
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ]),
          ),
        ]),
      ),
    );
  }
}
