import 'package:flutter_lovers/model/base/i_base_model.dart';

/// created by YunusEmre
/// on 29-Oct-22

abstract class ICloudBaseService<T extends IBaseModel> {
  Future<T?> addNewUser(T model);

  Future<String?> update(T model);
}
