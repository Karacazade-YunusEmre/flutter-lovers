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
  Future<void> addNewUser(UserModel model) async {
    try {
      await _fireStore.collection('Users').doc(model.id).set(model.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String?> update(UserModel model) async {
    try {
      await _fireStore.collection('Users').doc(model.id).update(model.toJson());
      return model.id;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel?> getUserByEmail({required String email}) async {
    try {
      var userRef = _fireStore.collection('Users').limit(1);
      var result = await userRef.where('email', isEqualTo: email).get();

      if (result.docs.isEmpty) {
        return null;
      } else {
        String id = result.docs.first['id'];
        String email = result.docs.first['email'];
        String username = result.docs.first['username'];
        DateTime? createdDate = DateTime.tryParse(result.docs.first['createdDate']);
        DateTime? lastLogInTime = DateTime.tryParse(result.docs.first['lastLogInTime']);
        String profilePictureUrl = result.docs.first['profilePictureUrl'];

        return UserModel(
          id: id,
          email: email,
          username: username,
          createdDate: createdDate,
          lastLogInTime: lastLogInTime,
          profilePictureUrl: profilePictureUrl,
        );
      }
    } catch (e) {
      rethrow;
    }
  }
}
