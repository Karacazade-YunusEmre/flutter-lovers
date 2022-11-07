import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_lovers/controller/user_authentication_controller.dart';
import 'package:flutter_lovers/utilities/login_page_messages.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

/// created by YunusEmre
/// on 26-Oct-22

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late UserAuthenticationController userController;
  Duration get loginTime => const Duration(milliseconds: 2250);

  @override
  void initState() {
    super.initState();

    userController = Get.find();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Flutter Lovers',
      logo: const AssetImage('assets/images/flutter_logo.png'),
      onLogin: _onLogin,
      onSignup: _onSignup,
      onRecoverPassword: _onRecoverPassword,
      hideForgotPasswordButton: true,
      onSubmitAnimationCompleted: () => Get.offAndToNamed('/'),
      loginAfterSignUp: true,
      userValidator: userController.emailValidator,
      passwordValidator: userController.passwordValidator,
      messages: LoginPageMessages.getLoginMessages,
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon: FontAwesomeIcons.google,
          label: 'Google',
          callback: () async {
            bool result = await Future.delayed(loginTime).then((_) => userController.userSignInWithGoogle());
            if (result) {
              return null;
            } else {
              return 'Google ile giriş sırasında hata oluştu';
            }
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          label: 'Facebook',
          callback: () async {
            bool result = await Future.delayed(loginTime).then((_) => userController.userLogInWithFacebook());
            if (result) {
              return null;
            } else {
              return 'Facebook ile giriş sırasında hata oluştu!';
            }
          },
        ),
      ],
    );
  }

  Future<String?>? _onLogin(LoginData loginData) async {
    return Future.delayed(loginTime).then((_) async {
      bool result = await userController.userSignInWithEmailAndPassword(email: loginData.name, password: loginData.password);
      if (result) {
        return null;
      } else {
        return 'Kullanıcı geçerli değil!';
      }
    });
  }

  Future<String?>? _onRecoverPassword(String email) async {
    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(name)) {
      //   return 'Kullanıcı bulunamadı!';
      // }
      return null;
    });
  }

  Future<String?>? _onSignup(SignupData signupData) async {
    return Future.delayed(loginTime).then((_) async {
      final result = await userController.userRegisterWithEmailAndPassword(email: signupData.name!, password: signupData.password!);
      if (result) {
        return null;
      } else {
        return 'Kullanıcı ekleme işlemi sırasında hata oluştu!';
      }
    });
  }
}
