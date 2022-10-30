import 'package:flutter_lovers/model/base/i_base_model.dart';

/// created by YunusEmre
/// on 26-Oct-22

abstract class IAuthBaseService<T extends IBaseModel> {
  Future<String?> userRegisterWithEmailAndPassword(T model);

  Future<bool> userSignInWithEmailAndPassword(T model);

  Future<T?> userSignInWithGoogle();

  Future<T?> userSignInWithFacebook();

  Future<void> userSignOut();

  T? getCurrentUser();

  Future<bool> isUserSignIn();
}
