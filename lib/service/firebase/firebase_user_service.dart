import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_lovers/model/concrete/user_model.dart';
import 'package:flutter_lovers/service/base/i_user_base_service.dart';
import 'package:flutter_lovers/utilities/mixins/exception_mixin.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// created by YunusEmre
/// on 26-Oct-22

class FirebaseUserService with ExceptionMixin implements IUserBaseService<UserModel> {
  late FirebaseAuth _firebaseAuth;

  FirebaseUserService() {
    _firebaseAuth = FirebaseAuth.instance;
  }

  @override
  UserModel? getCurrentUser() {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        UserModel userModel = UserModel(id: user.uid, email: user.email!);
        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<bool> isUserSignIn() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<UserModel?> userRegisterWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        return UserModel(
          email: userCredential.user!.email!,
          id: userCredential.user!.uid,
          profilePictureUrl: userCredential.user!.photoURL,
          username: userCredential.user!.displayName,
          createdDate: userCredential.user!.metadata.creationTime,
          lastLogInTime: userCredential.user!.metadata.lastSignInTime,
        );
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        throw Exception('Kullanıcı Tanımlı!');
      } else {
        throw Exception(e);
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserModel?> userSignInWithEmailAndPassword({required String email, required String password}) async {
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user!.email!,
          username: userCredential.user!.displayName,
          profilePictureUrl: userCredential.user!.photoURL,
          createdDate: userCredential.user!.metadata.creationTime,
          lastLogInTime: userCredential.user!.metadata.lastSignInTime,
        );

        return userModel;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserModel?> userSignInWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

      if (userCredential.user != null) {
        return UserModel(
          email: userCredential.user!.email!,
          username: userCredential.user!.displayName,
          profilePictureUrl: userCredential.user!.photoURL,
          id: userCredential.user!.uid,
          createdDate: userCredential.user!.metadata.creationTime,
          lastLogInTime: userCredential.user!.metadata.lastSignInTime,
        );
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<UserModel?> userSignInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

      if (userCredential.user != null) {
        UserModel model = UserModel(
          id: userCredential.user!.uid,
          email: userCredential.user!.email!,
          username: userCredential.user!.displayName,
          profilePictureUrl: userCredential.user!.photoURL,
          // createdDate: userCredential.user!.metadata.creationTime,
          // lastLogInTime: userCredential.user!.metadata.lastSignInTime,
        );
        return model;
      } else {
        return null;
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> userSignOut() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      if (currentUser != null) {
        _firebaseAuth.signOut();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
