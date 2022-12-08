import 'dart:io';
import 'package:flutter/material.dart';

/// Created by YunusEmre
/// On 19-Nov-22

abstract class APlatformResponsiveWidget extends StatelessWidget {
  const APlatformResponsiveWidget({super.key});

  Widget buildMaterialWidget(BuildContext context);

  Widget buildCupertinoWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return buildCupertinoWidget(context);
    } else {
      return buildMaterialWidget(context);
    }
  }
}
