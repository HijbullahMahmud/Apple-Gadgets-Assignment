import 'package:apple_gadgets_assignment/app/views/auth/auth_screen.dart';
import 'package:apple_gadgets_assignment/app/views/profile/profile_screen.dart';
import 'package:apple_gadgets_assignment/app/views/splash/splash_screen.dart';

class Routes {
  static const String splashScreen = "/splash_screen";
  static const String authScreen = "/auth_screen";
  static const String profileScreen = "/profile_screen";

  static var list = {
    Routes.splashScreen: (context) => SplashScreen(),
    Routes.authScreen: (context) => const AuthScreen(),
    Routes.profileScreen: (context) => const ProfileScreen(),
  };
}
