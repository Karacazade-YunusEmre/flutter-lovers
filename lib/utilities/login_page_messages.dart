import 'package:flutter_login/flutter_login.dart';

/// created by YunusEmre
/// on 26-Oct-22

class LoginPageMessages {
  static LoginMessages get getLoginMessages {
    return LoginMessages(
      userHint: 'Email',
      signUpSuccess: 'signUpSuccess',
      setPasswordButton: 'setPasswordButton',
      resendCodeSuccess: 'resendCodeSuccess',
      providersTitleSecond: 'providersTitleSecond',
      providersTitleFirst: 'Diğer kullanıcı giriş yöntemleri',
      flushbarTitleSuccess: 'Tebrikler',
      flushbarTitleError: 'Hata Oluştu!',
      confirmSignupSuccess: 'confirmSignupSuccess',
      confirmSignupIntro: 'confirmSignupIntro',
      confirmSignupButton: 'confirmSignupButton',
      confirmationCodeValidationError: 'confirmationCodeValidationError',
      confirmationCodeHint: 'confirmationCodeHint',
      additionalSignUpSubmitButton: 'additionalSignUpSubmitButton',
      additionalSignUpFormDescription: 'additionalSignUpFormDescription',
      resendCodeButton: 'resendCodeButton',
      confirmRecoverSuccess: 'confirmRecoverSuccess',
      recoveryCodeHint: 'recoveryCodeHint',
      recoverPasswordSuccess: 'recoverPasswordSuccess',
      goBackButton: 'Geri Dön',
      recoverPasswordIntro: 'Şifrenizi Sıfırlayın',
      recoverPasswordDescription: 'Email adresinize sıfırlama\nmail\'i göndereceğiz.',
      recoverPasswordButton: 'Şifremi Sıfırla',
      confirmPasswordError: 'confirmPasswordError',
      signupButton: 'Kayıt Ol',
      passwordHint: 'Şifre',
      forgotPasswordButton: 'Şifrenizi mi Unuttunuz?',
      loginButton: 'Giriş Yap',
      confirmPasswordHint: 'Şifrenizi onaylayın',
      confirmRecoverIntro: 'confirmRecoverIntro',
      recoverCodePasswordDescription: 'recoverCodePasswordDescription',
      recoveryCodeValidationError: 'recoveryCodeValidationError',
    );
  }
}
