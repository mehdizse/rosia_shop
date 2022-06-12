import 'package:get/get.dart';

class AuthController extends GetxController {
  bool isVisibility = false;
  bool isChecked = false;

  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checked() {
    isChecked = !isChecked;
    update();
  }
}
