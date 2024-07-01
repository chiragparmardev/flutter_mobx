// To parse this JSON data, do
//
//     final otpReqModel = otpReqModelFromJson(jsonString);

// ignore_for_file: unused_import

import 'package:meta/meta.dart';
import 'dart:convert';

OtpReqModel otpReqModelFromJson(String str) =>
    OtpReqModel.fromJson(json.decode(str));

String otpReqModelToJson(OtpReqModel data) => json.encode(data.toJson());

class OtpReqModel {
  String appVersion;
  String countryCode;
  String deviceToken;
  String deviceName;
  String deviceType;
  String email;
  String modelName;
  String osVersion;
  String phone;

  OtpReqModel({
    required this.appVersion,
    required this.countryCode,
    required this.deviceToken,
    required this.deviceName,
    required this.deviceType,
    required this.email,
    required this.modelName,
    required this.osVersion,
    required this.phone,
  });

  factory OtpReqModel.fromJson(Map<String, dynamic> json) => OtpReqModel(
        appVersion: json["app_version"],
        countryCode: json["country_code"],
        deviceToken: json["device_token"],
        deviceName: json["device_name"],
        deviceType: json["device_type"],
        email: json["mailto:email"],
        modelName: json["model_name"],
        osVersion: json["os_version"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "app_version": appVersion,
        "country_code": countryCode,
        "device_token": deviceToken,
        "device_name": deviceName,
        "device_type": deviceType,
        "mailto:email": email,
        "model_name": modelName,
        "os_version": osVersion,
        "phone": phone,
      };
}
