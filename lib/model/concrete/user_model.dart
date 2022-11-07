import 'package:flutter_lovers/model/base/i_base_model.dart';
import 'package:json_annotation/json_annotation.dart';

/// created by YunusEmre
/// on 26-Oct-22
part 'user_model.g.dart';

@JsonSerializable()
class UserModel implements IBaseModel {
  String? id;
  String email;
  String? username;
  String? profilePictureUrl;
  DateTime? createdDate;
  DateTime? lastLogInTime;

  UserModel({
    this.id,
    required this.email,
    this.username,
    this.profilePictureUrl,
    this.createdDate,
    this.lastLogInTime,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
