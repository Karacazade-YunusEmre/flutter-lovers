import 'package:flutter_lovers/controller/bindings/home_binding.dart';
import 'package:flutter_lovers/controller/bindings/user_binding.dart';
import 'package:flutter_lovers/ui/pages/home_page.dart';
import 'package:flutter_lovers/ui/pages/login_page.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 26-Oct-22

Duration _transitionDuration = const Duration(milliseconds: 375);

class Routes {
  static List<GetPage> get getRoutes {
    return <GetPage>[
      GetPage(
        name: '/',
        page: () => const HomePage(),
        transitionDuration: _transitionDuration,
        transition: Transition.leftToRightWithFade,
        binding: HomeBinding(),
      ),
      GetPage(
        name: '/login_page',
        page: () => const LoginPage(),
        transitionDuration: _transitionDuration,
        transition: Transition.leftToRightWithFade,
        binding: UserBinding(),
      ),
    ];
  }
}
