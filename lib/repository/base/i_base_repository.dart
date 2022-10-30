import 'package:flutter_lovers/model/base/i_base_model.dart';

/// created by YunusEmre
/// on 29-Oct-22

abstract class IBaseRepository<T extends IBaseModel> {
  Future<List<T>> getAll();

  Future<int?> add(T model);

  Future<bool?> delete(T model);

  Future<int?> update(T model);
}
