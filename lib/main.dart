import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/controller/main_controller.dart';
import 'package:flutter_lovers/firebase_options.dart';
import 'package:flutter_lovers/service/base/i_user_base_service.dart';
import 'package:flutter_lovers/service/base/i_cloud_base_service.dart';
import 'package:flutter_lovers/service/firebase/firebase_user_service.dart';
import 'package:flutter_lovers/service/firebase/firebase_cloud_service.dart';
import 'package:flutter_lovers/utilities/app_theme_data.dart';
import 'package:flutter_lovers/utilities/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

late IUserBaseService userService;
late ICloudBaseService cloudService;
late MainController _mainController;

Future<void> main() async {
  await initApp();
  setupLocator();
  setupController();
  runApp(const MainApp());
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void setupLocator() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<IUserBaseService>(() => FirebaseUserService());
  getIt.registerLazySingleton<ICloudBaseService>(() => FirebaseCloudService());

  userService = getIt<IUserBaseService>();
  cloudService = getIt<ICloudBaseService>();
}

void setupController() {
  _mainController = Get.put<MainController>(MainController());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Conversation App',
          theme: AppThemeData.getMaterialLightThemeData,
          initialRoute: _mainController.initialRoute,
          getPages: Routes.getRoutes,
        );
      },
    );
  }
}
