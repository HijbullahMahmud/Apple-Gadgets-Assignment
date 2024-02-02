import 'package:apple_gadgets_assignment/app/views/splash/splash_screen.dart';

class Routes{
  static const String splashScreen = "/splash_screen";
   

   static var list = {
    Routes.splashScreen: (context) => const SplashScreen(),
   };
}