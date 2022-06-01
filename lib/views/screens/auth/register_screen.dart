import 'package:ecommerce_app/views/widgets/auth/bottom_container.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          TextUtil(
                              text: "SIGN",
                              color: mainColor,
                              fontSize: 28,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none),
                          SizedBox(
                            width: 4,
                          ),
                          TextUtil(
                              text: "UP",
                              color: Colors.black,
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
                        validator: () {},
                        prefixIcon: Image.asset("assets/user.png"),
                        suffixIcon: const Text(""),
                        hintText: "User Name",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                        controller: emailController,
                        obscureText: false,
                        validator: () {},
                        prefixIcon: Image.asset("assets/email.png"),
                        suffixIcon: const Text(""),
                        hintText: "Email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthTextFormField(
                        controller: passwordController,
                        obscureText: true,
                        validator: () {},
                        prefixIcon: Image.asset("assets/lock.png"),
                        suffixIcon: const Text(""),
                        hintText: "Password",
                      ),
                      const SizedBox(height: 50),
                      const CheckWidget(),
                      const SizedBox(
                        height: 50,
                      ),
                      AuthButton(text: "Sign Up", onPressed: () {}),
                    ],
                  ),
                ),
              ),
              BottomContainer(
                text: "Already have an account ? ",
                textType: "Login In",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
