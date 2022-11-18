import 'package:flutter/material.dart';
import 'package:flutter_lovers/controller/main_controller.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 07-Nov-22

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  late MainController mainController;

  @override
  void initState() {
    super.initState();

    mainController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> BottomNavigationBar(
        currentIndex: mainController.selectedBottomNavigationIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add),
            label: 'Kişisel',
          ),
        ],
        onTap: mainController.changeSelectedBottomNavigationIndex,
      ),
    );
  }
}
