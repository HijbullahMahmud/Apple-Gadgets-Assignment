import 'package:apple_gadgets_assignment/app/routes.dart';
import 'package:apple_gadgets_assignment/services/local_db_service.dart';
import 'package:apple_gadgets_assignment/utils/keys.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    _goToAuthScreen();
    super.onInit();
  }

  Future<void> _goToAuthScreen() async {
    String? token = await LocalDBService().getFromLocalDB(Keys.token);
    //if token null
    // go to auth screen
    //else go to profile screen
    if (token == null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.authScreen);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.profileScreen);
      });
    }
  }
}
