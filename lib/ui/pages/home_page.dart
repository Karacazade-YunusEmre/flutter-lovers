import 'package:flutter/material.dart';
import 'package:flutter_lovers/controller/user_controller.dart';
import 'package:flutter_lovers/model/concrete/user_model.dart';
import 'package:flutter_lovers/ui/widget/home_page_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 26-Oct-22

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserController userController;
  late UserModel? currentUser;

  @override
  void initState() {
    super.initState();

    userController = Get.find();
    currentUser = userController.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          const HomePageAppBar(),
          Container(
            width: 1.sw,
            height: 0.85.sh,
            color: Colors.green,
            child: Center(
              child: Text('Giriş yapan kullanıcı: ${currentUser?.email}'),
            ),
          ),
        ],
      ),
    );
  }
}
