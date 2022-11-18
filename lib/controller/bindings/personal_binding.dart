import 'package:flutter_lovers/controller/personal_controller.dart';
import 'package:get/get.dart';

/// Created by YunusEmre
/// On 18-Nov-22

class PersonalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}
