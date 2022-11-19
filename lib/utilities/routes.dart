import 'package:flutter_lovers/controller/bindings/home_binding.dart';
import 'package:flutter_lovers/controller/bindings/personal_binding.dart';
import 'package:flutter_lovers/ui/pages/home_page.dart';
import 'package:flutter_lovers/ui/pages/login_page.dart';
import 'package:flutter_lovers/ui/pages/personal_page.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;

/// created by YunusEmre
/// on 26-Oct-22

Duration _transitionDuration = const Duration(milliseconds: 200);

class Routes {
  static List<GetPage> get getRoutes {
    return <GetPage>[
      GetPage(
        name: '/home_page',
        page: () => const HomePage(),
        transitionDuration: _transitionDuration,
        transition: Platform.isIOS ? Transition.leftToRightWithFade : Transition.downToUp,
        binding: HomeBinding(),
      ),
      GetPage(
        name: '/personal_page',
        page: () => const PersonalPage(),
        transitionDuration: _transitionDuration,
        transition: Platform.isIOS ? Transition.leftToRightWithFade : Transition.downToUp,
        binding: PersonalBinding(),
      ),
      GetPage(
        name: '/login_page',
        page: () => const LoginPage(),
        transitionDuration: _transitionDuration,
        transition: Platform.isIOS ? Transition.leftToRightWithFade : Transition.downToUp,
      ),
    ];
  }
}
