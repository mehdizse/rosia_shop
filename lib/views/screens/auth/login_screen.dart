import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/theme.dart';
import 'package:ecommerce_app/views/widgets/auth/auth_button.dart';
import 'package:ecommerce_app/views/widgets/text_util.dart';
import '../../widgets/auth/auth_text_formfield.dart';
import '../../widgets/auth/check_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            children: [],
          ),
        ),
      ),
    );
  }
}
