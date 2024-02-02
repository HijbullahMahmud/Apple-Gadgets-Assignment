import 'package:apple_gadgets_assignment/app/routes.dart';
import 'package:apple_gadgets_assignment/services/local_db_service.dart';
import 'package:apple_gadgets_assignment/utils/keys.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void logout() {
    LocalDBService().removeFromLocalDB(Keys.token);
    Get.offAllNamed(Routes.authScreen);
  }
}
