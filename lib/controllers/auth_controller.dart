import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/services/auth_service.dart';
import '../modules/home/home_screen.dart';

class AuthController extends GetxController {

  final emailController =
  TextEditingController();

  final passwordController =
  TextEditingController();

  void login() {

    String email =
    emailController.text.trim();

    String password =
    passwordController.text.trim();

    if (email == AuthService.adminEmail &&
        password ==
            AuthService.adminPassword) {

      Get.snackbar(
        "Success",
        "Login Successful",
      );

      Get.offAll(() => HomeScreen());

    } else {

      Get.snackbar(
        "Error",
        "Invalid Email or Password",
      );
    }
  }
}