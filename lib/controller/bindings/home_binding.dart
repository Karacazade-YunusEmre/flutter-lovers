import 'package:flutter_lovers/controller/home_controller.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 04-Nov-22

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
