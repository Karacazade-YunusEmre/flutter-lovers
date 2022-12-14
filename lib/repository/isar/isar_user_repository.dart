// import 'package:flutter_lovers/model/concrete/user_model.dart';
// import 'package:flutter_lovers/repository/base/i_base_repository.dart';
// import 'package:isar/isar.dart';
//
// /// created by YunusEmre
// /// on 29-Oct-22
//
// class IsarUserRepository implements IBaseRepository<UserModel> {
//   late Isar _isar;
//
//   IsarUserRepository() {
//     setupIsar();
//   }
//
//   Future<void> setupIsar() async {
//     // _isar = await Isar.open([UserModelSchema]);
//     // _isar = Isar.openSync([UserModelSchema]);
//   }
//
//   @override
//   Future<int?> add(UserModel model) async {
//     return await _isar.writeTxn(() async {
//       return await _isar.userModels.put(model);
//     });
//   }
//
//   @override
//   Future<bool?> delete(UserModel model) async {
//     return await _isar.writeTxn(() async {
//       return await _isar.userModels.delete(model.localId!);
//     });
//   }
//
//   @override
//   Future<List<UserModel>> getAll() async {
//     return await _isar.userModels.where().findAll();
//   }
//
//   @override
//   Future<int?> update(UserModel model) async {
//     return await _isar.writeTxn(() async {
//       return await _isar.userModels.put(model);
//     });
//   }
// }
