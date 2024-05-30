// To parse this JSON data, do
//
//     final userUpdateRequestModel = userUpdateRequestModelFromJson(jsonString);

import 'dart:convert';

UserUpdateRequestModel userUpdateRequestModelFromJson(String str) =>
    UserUpdateRequestModel.fromJson(json.decode(str));

String userUpdateRequestModelToJson(UserUpdateRequestModel data) =>
    json.encode(data.toJson());

class UserUpdateRequestModel {
  String name;
  String job;

  UserUpdateRequestModel({
    required this.name,
    required this.job,
  });

  factory UserUpdateRequestModel.fromJson(Map<String, dynamic> json) =>
      UserUpdateRequestModel(
        name: json["name"],
        job: json["job"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
      };
}
