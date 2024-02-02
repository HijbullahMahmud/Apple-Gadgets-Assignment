import 'package:apple_gadgets_assignment/app/routes.dart';
import 'package:apple_gadgets_assignment/model/profile_response.dart';
import 'package:apple_gadgets_assignment/model/user_profile.dart';
import 'package:apple_gadgets_assignment/services/local_db_service.dart';
import 'package:apple_gadgets_assignment/services/network_service.dart';
import 'package:apple_gadgets_assignment/utils/helper.dart';
import 'package:apple_gadgets_assignment/utils/keys.dart';
import 'package:apple_gadgets_assignment/utils/strings.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  Future<ProfileResponse?> getProfileAndPhoneNumber() async {
    var apiList = [_getUserProfile(), _lastFourDigitsPhoneNumber()];
    var response = await Future.wait(apiList);
    var profile = response[0] as UserProfile?;
    var phoneNumber = response[1] as String?;
    if (profile == null || phoneNumber == null) {
      showSnackBar(Strings.accessDenied);
      logout();
      return null;
    }
    return ProfileResponse(profile, phoneNumber);
  }

  Future<UserProfile?> _getUserProfile() async {
    var userProfile = await NetworkService().userProfile();
    return userProfile;
  }

  Future<String?> _lastFourDigitsPhoneNumber() async {
    var phoneNumber = await NetworkService().lastFourDigitsPhoneNumber();
    return phoneNumber;
  }

  void logout() {
    LocalDBService().removeFromLocalDB(Keys.token);
    LocalDBService().removeFromLocalDB(Keys.loginId);
    Get.offAllNamed(Routes.authScreen);
  }
}
