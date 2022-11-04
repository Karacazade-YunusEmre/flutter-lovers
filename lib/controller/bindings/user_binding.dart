import 'package:flutter_lovers/controller/user_controller.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 04-Nov-22

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
  }
}
