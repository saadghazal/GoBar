import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gobar/bindings/onboarding_binding.dart';
import 'package:gobar/views/on_boarding/main_onboarding.dart';
import 'package:gobar/views/splash_screen.dart';

class AppRoutes {
  static List<GetPage> getRoutes() {
    return [
      GetPage(
        name: '/',
        page: () => SplashScreen(),
      ),
      GetPage(
        name: '/onboarding',
        page: () => MainOnboarding(),
        binding: OnboardingBinding(),
      ),
    ];
  }
}
