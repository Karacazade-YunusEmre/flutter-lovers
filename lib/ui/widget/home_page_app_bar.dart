import 'package:flutter/material.dart';
import 'package:flutter_lovers/controller/user_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 27-Oct-22

class HomePageAppBar extends StatefulWidget {
  const HomePageAppBar({Key? key}) : super(key: key);

  @override
  State<HomePageAppBar> createState() => _HomePageAppBarState();
}

class _HomePageAppBarState extends State<HomePageAppBar> {
  late UserController userController;

  @override
  void initState() {
    super.initState();

    userController = Get.find();
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
                  userController.userLogOut();
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
