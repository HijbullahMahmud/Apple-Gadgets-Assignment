import 'package:apple_gadgets_assignment/app/controllers/auth_controller.dart';
import 'package:apple_gadgets_assignment/app/controllers/profile_controller.dart';
import 'package:apple_gadgets_assignment/app/controllers/splash_controller.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => ProfileController());
  }
}
