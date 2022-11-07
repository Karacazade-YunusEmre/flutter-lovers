import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_lovers/controller/user_authentication_controller.dart';
import 'package:flutter_lovers/firebase_options.dart';
import 'package:flutter_lovers/service/base/i_auth_base_service.dart';
import 'package:flutter_lovers/service/base/i_cloud_base_service.dart';
import 'package:flutter_lovers/service/firebase/firebase_auth_service.dart';
import 'package:flutter_lovers/service/firebase/firebase_cloud_service.dart';
import 'package:flutter_lovers/utilities/app_theme_data.dart';
import 'package:flutter_lovers/utilities/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

late IAuthBaseService userService;
late ICloudBaseService cloudService;
late UserAuthenticationController _userController;

Future<void> main() async {
  await initApp();
  setupLocator();
  setupController();
  runApp(const MainApp());
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

void setupLocator() {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton<IAuthBaseService>(() => FirebaseAuthService());
  getIt.registerLazySingleton<ICloudBaseService>(() => FirebaseCloudService());

  userService = getIt<IAuthBaseService>();
  cloudService = getIt<ICloudBaseService>();
}

void setupController() {
  _userController = Get.put(UserAuthenticationController());
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
          theme: AppThemeData.getMainLightThemeData,
          initialRoute: _userController.initialRoute,
          getPages: Routes.getRoutes,
        );
      },
    );
  }
}
