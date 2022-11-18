import 'package:flutter/material.dart';
import 'package:flutter_lovers/controller/main_controller.dart';
import 'package:flutter_lovers/model/concrete/user_model.dart';
import 'package:flutter_lovers/ui/widget/app_bar_widget.dart';
import 'package:flutter_lovers/ui/widget/bottom_navigation_bar_widget.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 26-Oct-22

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late MainController mainController;
  late UserModel? currentUser;

  @override
  void initState() {
    super.initState();

    mainController = Get.find();
    currentUser = mainController.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      resizeToAvoidBottomInset: false,
      appBar: const AppBarWidget(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
              child: Center(
                child: Text('Giriş yapan kullanıcı: ${currentUser?.email}'),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
