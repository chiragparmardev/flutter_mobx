import 'package:flutter_demo_structure/core/api/base_response/base_response.dart';
import 'package:flutter_demo_structure/data/model/request/login_request_model.dart';
import 'package:flutter_demo_structure/data/model/request/otp_reqest_model.dart';
import 'package:flutter_demo_structure/data/model/request/social_profile_request_model.dart';
import 'package:flutter_demo_structure/data/model/response/otp_response.dart';
import 'package:flutter_demo_structure/data/model/response/social_profile.response.dart';
import 'package:flutter_demo_structure/data/model/response/user_profile_response.dart';

abstract class AuthRepository {
  Future<BaseResponse<UserData?>> signIn(LoginRequestModel request);

  Future<BaseResponse> logout();

  Future<BaseResponse<OtpResModel>> sendOtp(OtpReqModel request);

  Future<BaseResponse<SocialProfileResModel>> getProfile(
      SocialProfileReqModel request);
  
}
