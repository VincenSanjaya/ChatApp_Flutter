import 'package:chatty/pages/frame/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final title = "Coms.";
  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    print(" WelcomeController ");
  }
}