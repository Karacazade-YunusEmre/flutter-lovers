import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';

/// Created by YunusEmre
/// On 19-Nov-22

mixin ExceptionMixin {
  void handleException(VoidCallback voidCallBack) {
    try {
      voidCallBack();
    } on FirebaseException catch (e) {
      throw 'Firebase hatası: $e';
    } catch (e) {
      throw 'Hata oluştu. ${e.toString()}';
    }
  }
}
