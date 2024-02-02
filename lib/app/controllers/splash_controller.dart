import 'package:apple_gadgets_assignment/app/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  @override
  void onInit() {
    _goToAuthScreen();
    super.onInit();
  }

  Future<void> _goToAuthScreen()async{
    Future.delayed(const Duration(seconds: 3), (){
      Get.offAllNamed(Routes.authScreen);
    });
  }
}