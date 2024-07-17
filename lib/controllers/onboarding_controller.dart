import 'package:get/get.dart';

class OnboardingController extends GetxController {
  double _titleOpacity = 0;
  double get titleOpacity => _titleOpacity;

  set titleOpacity(double opacity) {
    _titleOpacity = opacity;
    update();
  }

  double _descriptionOpacity = 0;
  double get descriptionOpacity => _descriptionOpacity;
  set descriptionOpacity(double opacity) {
    _descriptionOpacity = opacity;
    update();
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;

  int _currentDot = 0;
  int get currentDot => _currentDot;
  //
  // @override dispose(){
  //   super.dispose();
  //
  //
  // }

  List<String> pictures = [
    'assets/images/on1.png',
    'assets/images/on2.png',
    'assets/images/on3.png'
  ];
  Map<String, String> onDescription = {
    "Welcome Gobars":
        "Find the best grooming experience in your city with just one tap! Don't miss out on the haircut or treatment of your dreams. Let's start now!",
    "Loooking for barber?":
        "Find the best barbershop around you in seconds, make an appointment, and enjoy the best grooming experience.",
    "Everything in your hands":
        "With Gobar, find high-quality barbershops, see reviews, and make appointments easily. Achieve your confident appearance!",
  };

  Future<void> initTitleOpacity() async {
    await Future.delayed(
      Duration(milliseconds: 200),
    );
    _titleOpacity = 1;

    update();
  }

  void incrementCurrentDot() {
    _currentDot++;
    update();
  }

  void incrementCurrentPage() {
    _currentPage++;
    update();
  }
}
