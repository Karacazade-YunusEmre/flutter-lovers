import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_lovers/model/concrete/user_model.dart';
import 'package:flutter_lovers/service/base/i_cloud_base_service.dart';

/// created by YunusEmre
/// on 29-Oct-22

class FirebaseCloudService implements ICloudBaseService<UserModel> {
  late FirebaseFirestore _fireStore;

  FirebaseCloudService() {
    _fireStore = FirebaseFirestore.instance;
  }

  @override
  Future<UserModel?> addNewUser(UserModel model) async {
    try {
      await _fireStore.collection('Users').doc(model.cloudId).set(model.toJson());

      return model;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> update(UserModel model) async {
    try {
      await _fireStore.collection('Users').doc(model.cloudId).update(model.toJson());
      return model.cloudId;
    } catch (e) {
      rethrow;
    }
  }
}
