import 'package:dio/dio.dart';

import 'package:retrofit/retrofit.dart';
import 'package:task_29_5/model/register/register_request_model.dart';
import 'package:task_29_5/model/user/user_update_request_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: 'https://reqres.in/api')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/register')
  Future<HttpResponse<dynamic>> register(
    @Body() RegisterRequestModel registerRequestModel,
  );

  @POST('/login')
  Future<HttpResponse<dynamic>> login(
    @Body() RegisterRequestModel registerRequestModel,
  );

  @GET('/users')
  Future<HttpResponse<dynamic>> getUsers();

  @DELETE('/users/')
  Future<HttpResponse<dynamic>> deleteUser(
    @Path('id') int id,
  );

  @POST('/users')
  Future<HttpResponse<dynamic>> createUser(
    @Body() UserUpdateRequestModel userUpdateRequestModel,
  );

  @PUT('/users/')
  Future<HttpResponse<dynamic>> updateUser(
    @Path('id') int id,
    @Body() UserUpdateRequestModel userUpdateRequestModel,
  );
}
