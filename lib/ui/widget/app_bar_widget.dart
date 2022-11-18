import 'package:flutter/material.dart';
import 'package:flutter_lovers/controller/main_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 27-Oct-22

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size(double.infinity, 0.1.sh);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late MainController mainController;

  @override
  void initState() {
    super.initState();

    mainController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      title: const Text('Flutter Lovers'),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              mainController.userLogOut();
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
    );
  }
}
