import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lovers/main.dart';
import 'package:flutter_lovers/model/base/i_base_model.dart';
import 'package:flutter_lovers/model/concrete/user_model.dart';
import 'package:flutter_lovers/utilities/date_operations_mixin.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 26-Oct-22

class UserController extends GetxController with DateOperationsMixin {
  final _initialRoute = '/'.obs;
  final userList = <UserModel>[].obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    await loadUserList();
    await _isUserSignIn();
  }

  ///#region getter and setter

  /// initialRoute getter
  String get initialRoute => _initialRoute.value;

  /// initialRoute setter
  set initialRoute(String value) => _initialRoute.value = value;

  ///#endregion getter and setter

  ///#region event methods

  Future<bool> userRegisterWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserModel? userModel = UserModel(email: email, password: password);
      String? userId = await userService.userRegisterWithEmailAndPassword(userModel);
      userModel.cloudId = userId;
      userModel.password = null;

      DateTime? presentDate = await getPresentDate();
      userModel.createdDate = presentDate;
      userModel.lastLogInTime = presentDate;

      userModel = await cloudService.addNewUser(userModel) as UserModel?;
      userList.add(userModel!);
      userRepository.add(userModel);

      return true;
    } catch (_) {
      debugPrint('Kullanıcı ekleme işlemi sırasında hata oluştu.');
      return false;
    }
  }

  Future<bool> userLogInWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserModel? savedUser = await userRepository.getUserByEmail(email);
      if (savedUser != null) {
        savedUser.password = password;
        final result = await userService.userSignInWithEmailAndPassword(savedUser);

        if (result) {
          UserModel? userModelFromUserList = userList.firstWhereOrNull((item) => item.email == savedUser.email);
          int userIndex = userList.indexOf(userModelFromUserList);

          DateTime? presentDate = await getPresentDate();
          savedUser.lastLogInTime = presentDate;
          savedUser.password = null;

          userRepository.update(savedUser);
          cloudService.update(savedUser);
          userList[userIndex] = savedUser;
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (_) {
      debugPrint('Kullanıcı oturum açma işlemi sırasında hata oluştu!');
      return false;
    }
  }

  Future<bool> userLogInWithGoogle() async {
    try {
      Map<String, dynamic> googleUser = await userService.userSignInWithGoogle();

      if (googleUser['email'] != null) {
        UserModel? savedUser = await userRepository.getUserByEmail(googleUser['email']);
        DateTime? presentDate = await getPresentDate();

        if (savedUser != null) {
          UserModel? userModelFromUserList = userList.firstWhereOrNull((item) => item.email == savedUser.email);
          int userIndex = userList.indexOf(userModelFromUserList);

          savedUser.lastLogInTime = presentDate;
          userRepository.update(savedUser);
          await cloudService.update(savedUser);
          userList[userIndex] = savedUser;
        } else {
          UserModel newUser = UserModel(
            email: googleUser['email'],
            cloudId: googleUser['cloudId'],
            createdDate: presentDate,
            lastLogInTime: presentDate,
          );
          int? localId = await userRepository.add(newUser);
          newUser.localId = localId;
          userList.add(newUser);
          await cloudService.addNewUser(newUser);
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
      Map<String, dynamic> facebookUser = await userService.userSignInWithFacebook();

      if (facebookUser['email'] != null) {
        UserModel? savedUser = await userRepository.getUserByEmail(facebookUser['email']);
        DateTime? presentDate = await getPresentDate();

        if (savedUser != null) {
          int userIndex = userList.indexOf(savedUser);
          savedUser.lastLogInTime = presentDate;
          userRepository.update(savedUser);
          await cloudService.update(savedUser);
          userList[userIndex] = savedUser;
        } else {
          UserModel newUser = UserModel(
            email: facebookUser['email'],
            cloudId: facebookUser['cloudId'],
            createdDate: presentDate,
            lastLogInTime: presentDate,
          );
          userRepository.add(newUser);
          userList.add(newUser);
          await cloudService.addNewUser(newUser);
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

  Future<void> _isUserSignIn() async {
    bool userState = await userService.isUserSignIn();
    if (userState) {
      debugPrint('User signed in already');
    } else {
      initialRoute = '/login_page';
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

  ///#endregion event methods

  ///#region general purpose methods

  Future<void> loadUserList() async {
    List<UserModel>? users = await userRepository.getAll();
    userList.addAll(users);
  }

  ///#endregion general purpose methods

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
