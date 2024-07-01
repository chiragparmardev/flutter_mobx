// To parse this JSON data, do
//
//     final socialProfileReqModel = socialProfileReqModelFromJson(jsonString);

// ignore_for_file: unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

SocialProfileReqModel socialProfileReqModelFromJson(String str) =>
    SocialProfileReqModel.fromJson(json.decode(str));

String socialProfileReqModelToJson(SocialProfileReqModel data) =>
    json.encode(data.toJson());

class SocialProfileReqModel {
  String socialProfileId;

  SocialProfileReqModel({
    required this.socialProfileId,
  });

  factory SocialProfileReqModel.fromJson(Map<String, dynamic> json) =>
      SocialProfileReqModel(
        socialProfileId: json["social_profile_id"],
      );

  Map<String, dynamic> toJson() => {
        "social_profile_id": socialProfileId,
      };
}
