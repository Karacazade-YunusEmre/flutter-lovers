import 'package:uuid/uuid.dart';

/// Created by YunusEmre
/// On 19-Nov-22

mixin UserAliasesMixin {
  String getUserAliases(String email) {
    String userName = email.substring(0, email.indexOf('@'));

    userName += const Uuid().v1();
    return userName;
  }
}
