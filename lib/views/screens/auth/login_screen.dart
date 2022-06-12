import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/views/widgets/auth/auth_button.dart';
import 'package:ecommerce_app/views/widgets/text_util.dart';
import 'package:get/get.dart';
import '../../../logic/controllers/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/string_validation.dart';
import '../../widgets/auth/auth_text_formfield.dart';
import '../../widgets/auth/bottom_container.dart';
import '../../widgets/auth/check_widget.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final controller = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtil(
                                text: "LOG",
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                            const SizedBox(
                              width: 4,
                            ),
                            TextUtil(
                                text: "IN",
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthTextFormField(
                          controller: emailController,
                          obscureText: false,
                          validator: (value) {
                            if (!RegExp(validationEmail).hasMatch(value)) {
                              return "Invalid email";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset("assets/email.png")
                              : const Icon(
                                  Icons.email,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffixIcon: const Text(""),
                          hintText: "Email",
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFormField(
                            controller: passwordController,
                            obscureText: controller.isVisibility ? true : false,
                            validator: (value) {
                              if (value.toString().length < 6) {
                                return "Password shoud be longer than 6 caracteres";
                              } else {
                                return null;
                              }
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset("assets/lock.png")
                                : const Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.visibility();
                              },
                              icon: Icon(
                                controller.isVisibility
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.black,
                              ),
                            ),
                            hintText: "Password",
                          );
                        }),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed(Routes.forgetPasswordPage);
                            },
                            child: TextUtil(
                                text: "Forget Password ?",
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthButton(text: "Log In", onPressed: () {}),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtil(
                            text: "OR",
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: Image.asset("assets/facebook.png")),
                            const SizedBox(
                              width: 20,
                            ),
                            InkWell(
                                onTap: () {},
                                child: Image.asset("assets/google.png")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                text: "Don't have an account ? ",
                textType: "Sign Up",
                onPressed: () {
                  Get.offNamed(Routes.registerPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
