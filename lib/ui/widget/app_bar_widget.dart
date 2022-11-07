import 'package:flutter/material.dart';
import 'package:flutter_lovers/controller/user_authentication_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 27-Oct-22

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late UserAuthenticationController userAuthenticationController;

  @override
  void initState() {
    super.initState();

    userAuthenticationController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 0.15.sh,
      color: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            /// title
            Positioned(
              left: 0.01.sw,
              top: 0.06.sh,
              child: Text(
                'Flutter Lovers',
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                ),
              ),
            ),

            /// logOut Button
            Positioned(
              right: 0.01.sw,
              top: 0.05.sh,
              child: ElevatedButton(
                onPressed: () {
                  userAuthenticationController.userLogOut();
                  Get.offAndToNamed('/login_page');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                child: const Text(
                  'Çıkış Yap',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
