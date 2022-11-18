import 'package:flutter/material.dart';
import 'package:flutter_lovers/ui/widget/app_bar_widget.dart';
import 'package:flutter_lovers/ui/widget/bottom_navigation_bar_widget.dart';

/// Created by YunusEmre
/// On 18-Nov-22

class PersonalPage extends StatefulWidget {
  const PersonalPage({Key? key}) : super(key: key);

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: Center(
        child: Text('Personal Page'),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
