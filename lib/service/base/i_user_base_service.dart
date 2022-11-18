import 'package:flutter_lovers/model/base/i_base_model.dart';

/// created by YunusEmre
/// on 26-Oct-22

abstract class IUserBaseService<T extends IBaseModel> {
  Future<T?> userRegisterWithEmailAndPassword({required String email, required String password});

  Future<T?> userSignInWithEmailAndPassword({required String email, required String password});

  Future<T?> userSignInWithGoogle();

  Future<T?> userSignInWithFacebook();

  Future<void> userSignOut();

  T? getCurrentUser();

  Future<bool> isUserSignIn();
}
