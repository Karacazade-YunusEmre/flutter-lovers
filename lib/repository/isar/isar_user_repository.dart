import 'package:flutter_lovers/model/concrete/user_model.dart';
import 'package:flutter_lovers/repository/base/i_user_base_repository.dart';
import 'package:isar/isar.dart';

/// created by YunusEmre
/// on 29-Oct-22

class IsarUserRepository implements IUserBaseRepository {
  late Isar _isar;

  IsarUserRepository() {
    setupIsar();
  }

  Future<void> setupIsar() async {
    _isar = await Isar.open([UserModelSchema]);
  }

  @override
  Future<int?> add(UserModel model) async {
    return await _isar.writeTxn(() async {
      return await _isar.userModels.put(model);
    });
  }

  @override
  Future<bool?> delete(UserModel model) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Future<int?> update(UserModel model) async {
    return await _isar.writeTxn(() async {
      return await _isar.userModels.put(model);
    });
  }

  @override
  Future<UserModel?> getUserByEmail(String email) async {
    final user = await _isar.userModels.filter().emailEqualTo(email).findFirst();
    return user;
  }
}
