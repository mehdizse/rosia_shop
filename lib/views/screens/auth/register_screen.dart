import 'package:ecommerce_app/logic/controllers/auth_controller.dart';
import 'package:ecommerce_app/routes/routes.dart';
import 'package:ecommerce_app/utils/string_validation.dart';
import 'package:ecommerce_app/views/widgets/auth/bottom_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/auth_button.dart';
import '../../widgets/auth/auth_text_formfield.dart';
import '../../widgets/auth/check_widget.dart';
import '../../widgets/text_util.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();
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
                                text: "SIGN",
                                color: Get.isDarkMode ? mainColor : pinkClr,
                                fontSize: 28,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.none),
                            const SizedBox(
                              width: 4,
                            ),
                            TextUtil(
                                text: "UP",
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
                          controller: nameController,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return "Enter a name please";
                            } else {
                              return null;
                            }
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset("assets/user.png")
                              : const Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffixIcon: const Text(""),
                          hintText: "User Name",
                        ),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(height: 50),
                        CheckWidget(),
                        const SizedBox(
                          height: 50,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                              text: "Sign Up",
                              onPressed: () {
                                if (controller.isChecked == false) {
                                  Get.snackbar(
                                    "Checkbox not checked",
                                    "Please accept terms and conditions",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                  );
                                } else if (formKey.currentState!.validate()) {
                                  String name = nameController.text.trim();
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.signUpUsingEmail(
                                      name: name,
                                      email: email,
                                      password: password);
                                  controller.isChecked = true;
                                }
                              });
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                text: "Already have an account ? ",
                textType: "Login In",
                onPressed: () {
                  Get.offNamed(Routes.loginPage);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
