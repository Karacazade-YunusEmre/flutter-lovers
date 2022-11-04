import 'package:flutter_lovers/model/base/i_base_model.dart';

/// created by YunusEmre
/// on 26-Oct-22

abstract class IAuthBaseService<T extends IBaseModel> {
  Future<String?> userRegisterWithEmailAndPassword(T model);

  Future<bool> userSignInWithEmailAndPassword(T model);

  Future<Map<String, dynamic>> userSignInWithGoogle();

  Future<Map<String, dynamic>> userSignInWithFacebook();

  Future<void> userSignOut();

  T? getCurrentUser();

  Future<bool> isUserSignIn();
}
