import 'package:ecommerce_app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../models/facebook_model.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isChecked = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  FacebookModel? facebookModel;
  var displayUserName = "";
  var displayUserPhoto = "";
  var googleSignIn = GoogleSignIn().signIn();

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checked() {
    isChecked = !isChecked;
    update();
  }

  void signUpUsingEmail({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        displayUserName = name;
        auth.currentUser!.updateDisplayName(displayUserName);
      });
      update();
      Get.offNamed(Routes.mainPage);
    } on FirebaseAuthException catch (error) {
      String title = "";
      String message = "";
      if (error.code == 'weak-password') {
        title = "Weak password";
        message = "Provided password is too weak...";
      } else if (error.code == 'email-already-in-use') {
        title = "Email already in use";
        message = "Account already exists for that email...";
      } else {
        title = "Error!";
        message = error.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void logInUsingEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUserName = value.user!.displayName!;
      });
      update();
      Get.offNamed(Routes.mainPage);
    } on FirebaseAuthException catch (error) {
      String title = "";
      String message = "";
      if (error.code == 'user-not-found') {
        title = "User Not Found";
        message = "No user found for that email...";
      } else if (error.code == 'wrong-password') {
        title = "Wrong Password";
        message = "Wrong password provided for that user...";
      } else {
        title = "Error!";
        message = error.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword({required String email}) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (error) {
      String title = "";
      String message = "";
      if (error.code == 'user-not-found') {
        title = "User Not Found";
        message = "No user found for that email...";
      } else {
        title = "Error!";
        message = error.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void signUpUsingFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login();
    final data = await FacebookAuth.instance.getUserData();
    facebookModel = FacebookModel.fromJson(data);
    print("===================");
    print(facebookModel!.name);
    print(facebookModel!.email);
    print("===================");
    Get.offNamed(Routes.mainPage);
  }

  Future<void> signUpUsginGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn;
      displayUserName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl!;
      update();
      Get.offNamed(Routes.mainPage);
    } catch (error) {
      Get.snackbar(
        "Error!",
        error.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  void logout() {}
}
