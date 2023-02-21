import 'package:chatty/pages/frame/welcome/state.dart';
import 'package:get/get.dart';

import '../../../common/routes/routes.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final title = "Coms.";
  final state = WelcomeState();

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(seconds:3), ()=>Get.offAllNamed(AppRoutes.Message));
  }
}