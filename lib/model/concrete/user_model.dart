import 'package:flutter_lovers/model/base/i_base_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

/// created by YunusEmre
/// on 26-Oct-22

part 'user_model.g.dart';

@JsonSerializable()
@collection
class UserModel implements IBaseModel {
  String? cloudId;
  Id? localId = Isar.autoIncrement;
  String email;
  String? password;
  String? username;
  String? profilePictureUrl;
  DateTime? createdDate;
  DateTime? lastLogInTime;

  UserModel({
    this.cloudId,
    this.localId,
    required this.email,
    this.password,
    this.username,
    this.profilePictureUrl,
    this.createdDate,
    this.lastLogInTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
