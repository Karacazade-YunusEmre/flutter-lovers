import 'package:flutter/material.dart';
import 'package:flutter_lovers/controller/home_controller.dart';
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
  late HomeController homeController;

  @override
  void initState() {
    super.initState();

    homeController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Text('HomePage'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
