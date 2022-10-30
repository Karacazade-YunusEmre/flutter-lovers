import 'package:flutter_lovers/model/concrete/user_model.dart';
import 'package:flutter_lovers/repository/base/i_base_repository.dart';

/// created by YunusEmre
/// on 29-Oct-22

abstract class IUserBaseRepository implements IBaseRepository<UserModel> {
  Future<UserModel?> getUserByEmail(String email);
}
