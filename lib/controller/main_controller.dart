import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/main.dart';
import 'package:flutter_lovers/model/base/i_base_model.dart';
import 'package:flutter_lovers/model/concrete/user_model.dart';
import 'package:flutter_lovers/utilities/date_operations_mixin.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 26-Oct-22

class MainController extends GetxController with DateOperationsMixin {
  final _initialRoute = '/home_page'.obs;
  final _selectedBottomNavigationIndex = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    await _isUserSignIn();
  }

  ///#region getter and setter

  /// initialRoute getter
  String get initialRoute => _initialRoute.value;

  /// initialRoute setter
  set initialRoute(String value) => _initialRoute.value = value;

  /// selectedBottomNavigationIndex getter
  int get selectedBottomNavigationIndex => _selectedBottomNavigationIndex.value;

  /// selectedBottomNavigationIndex setter
  set selectedBottomNavigationIndex(int value) => _selectedBottomNavigationIndex.value = value;

  ///#endregion getter and setter

  ///#region event methods

  Future<void> _isUserSignIn() async {
    bool userState = await userService.isUserSignIn();
    if (userState) {
      debugPrint('User signed in already');
    } else {
      initialRoute = '/login_page';
    }
  }

  Future<bool> userRegisterWithEmailAndPassword({required String email, required String password}) async {
    try {
      IBaseModel? model = await userService.userRegisterWithEmailAndPassword(email: email, password: password);

      if (model != null) {
        DateTime? presentDate = await getPresentDate();
        (model as UserModel).createdDate = presentDate;
        model.lastLogInTime = presentDate;
        cloudService.addNewUser(model);

        return true;
      } else {
        return false;
      }
    } catch (_) {
      debugPrint('Kullanıcı ekleme işlemi sırasında hata oluştu.');
      return false;
    }
  }

  Future<bool> userSignInWithEmailAndPassword({required String email, required String password}) async {
    try {
      IBaseModel? model = await userService.userSignInWithEmailAndPassword(email: email, password: password);

      if (model != null) {
        IBaseModel? savedModel = await cloudService.getUserByEmail(email: (model as UserModel).email);

        DateTime? presentDate = await getPresentDate();
        (savedModel as UserModel).lastLogInTime = presentDate;
        cloudService.update(savedModel);

        return true;
      } else {
        return false;
      }
    } catch (_) {
      debugPrint('Kullanıcı oturum açma işlemi sırasında hata oluştu!');

      return false;
    }
  }

  Future<bool> userSignInWithGoogle() async {
    try {
      IBaseModel? model = await userService.userSignInWithGoogle();

      if (model != null) {
        DateTime? presentDate = await getPresentDate();
        IBaseModel? savedModel = await cloudService.getUserByEmail(email: (model as UserModel).email);
        if (savedModel == null) {
          model.createdDate = presentDate;
          model.lastLogInTime = presentDate;
          cloudService.addNewUser(model);
        } else {
          (savedModel as UserModel).lastLogInTime = presentDate;
          cloudService.update(savedModel);
        }

        return true;
      } else {
        return false;
      }
    } catch (_) {
      debugPrint('Google ile giriş işlemi sırasında hata oluştu.');
      return false;
    }
  }

  Future<bool> userLogInWithFacebook() async {
    try {
      IBaseModel? model = await userService.userSignInWithGoogle();

      if (model != null) {
        IBaseModel? savedModel = await cloudService.getUserByEmail(email: (model as UserModel).email);

        if (savedModel == null) {
          cloudService.addNewUser(model);
        } else {
          cloudService.update(savedModel);
        }

        return true;
      } else {
        return false;
      }
    } catch (_) {
      debugPrint('Facebook ile giriş işlemi sırasında hata oluştu.');
      return false;
    }
  }

  UserModel? getCurrentUser() {
    try {
      IBaseModel? currentUser = userService.getCurrentUser();
      if (currentUser != null) {
        return currentUser as UserModel;
      } else {
        return null;
      }
    } catch (_) {
      debugPrint('Geçerli kullanıcı sorgulama sırasında hata oluştu.');
      return null;
    }
  }

  Future<bool> userLogOut() async {
    try {
      await userService.userSignOut();
      return true;
    } catch (_) {
      debugPrint('Kullanıcı çıkış işlemi sırasında hata oluştu.');
      return false;
    }
  }

  void changeSelectedBottomNavigationIndex(int value) {
    selectedBottomNavigationIndex = value;
    _changePage(selectedBottomNavigationIndex);
  }

  void _changePage(int index) {
    switch (index) {
      case 0:
        Get.offAndToNamed('/home_page');
        break;
      case 1:
        Get.offAndToNamed('/personal_page');
        break;
    }
  }

  ///#endregion event methods

  ///#region validation methods

  String? emailValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      if (EmailValidator.validate(value)) {
        return null;
      } else {
        return 'Email adresi geçerli değil!';
      }
    } else {
      return 'Email alanı boş olamaz!';
    }
  }

  String? passwordValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length <= 5) {
        return 'Parola 6 karakterden az olamaz!';
      } else {
        return null;
      }
    } else {
      return 'Parola alanı boş olamaz!';
    }
  }

  ///#endregion validation methods
}
