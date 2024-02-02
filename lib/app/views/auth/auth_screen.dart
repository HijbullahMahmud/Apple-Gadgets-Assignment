import 'package:apple_gadgets_assignment/app/controllers/auth_controller.dart';
import 'package:apple_gadgets_assignment/app/views/widgets/custom_button.dart';
import 'package:apple_gadgets_assignment/app/views/widgets/custom_text_field.dart';
import 'package:apple_gadgets_assignment/utils/digits_only_formatter.dart';
import 'package:apple_gadgets_assignment/utils/dimensions.dart';
import 'package:apple_gadgets_assignment/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  AuthController get controller => Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.login),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Dimensions.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextField(
              labelText: Strings.userName,
              controller: controller.userNameController,
              isDense: true,
              maxLine: 1,
              textInputFormatter: [DigitsOnlyFormatter()],
              textInputType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: Dimensions.defaultPadding),
            _passwordField(),
            const SizedBox(height: Dimensions.defaultPadding * 2),
            _loginButton(context),
          ],
        ),
      ),
    );
  }

  GetBuilder<AuthController> _loginButton(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller2) {
      return CustomButton(
          onPressed: controller.login,
          label: controller2.isLoading
              ? const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 1,
                    ),
                  ),
                )
              : Text(
                  Strings.login,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ));
    });
  }

  GetBuilder<AuthController> _passwordField() {
    return GetBuilder<AuthController>(
        id: 'obscure',
        builder: (controller) {
          return CustomTextField(
            labelText: Strings.password,
            controller: controller.passwordController,
            textInputType: TextInputType.visiblePassword,
            // prefixIcon: Icons.key,
            suffixIcon:
                controller.isObscure ? Icons.visibility_off : Icons.visibility,
            isObscure: controller.isObscure,
            onSuffixPressed: controller.toggleIsObscure,
          );
        });
  }
}
