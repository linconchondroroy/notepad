import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';

import '../../core/constants/app_strings.dart';
import '../../core/widgets/custom_button.dart';
import '../../core/widgets/custom_textfield.dart';

import 'signup_screen.dart';
import 'forget_password_screen.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({super.key});

  final AuthController controller =
  Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(AppStrings.login),
        centerTitle: true,
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            CustomTextField(
              controller: controller.emailController,
              hintText: AppStrings.email,
            ),

            const SizedBox(height: 16),

            CustomTextField(
              controller: controller.passwordController,
              hintText: AppStrings.password,
              obscureText: true,
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: AppStrings.login,
              onPressed: controller.login,
            ),

            const SizedBox(height: 14),

            TextButton(
              onPressed: () {
                Get.to(() => ForgetPasswordScreen());
              },
              child: const Text(
                AppStrings.forgetPassword,
              ),
            ),

            TextButton(
              onPressed: () {
                Get.to(() => SignupScreen());
              },
              child: const Text("Create Account"),
            ),
          ],
        ),
      ),
    );
  }
}