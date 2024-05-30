import 'package:task_29_5/model/register/register_request_model.dart';
import 'package:task_29_5/model/user/user_update_request_model.dart';
import 'package:task_29_5/services/api_services.dart';

class ApiRepository {
  final ApiService apiService;

  ApiRepository(this.apiService);

  Future<dynamic> register(RegisterRequestModel registerRequestModel) async {
    var response = await apiService.register(registerRequestModel);
    if (response.response.statusCode == 200) {
      return response.data;
    }
  }

  Future<dynamic> login(RegisterRequestModel registerRequestModel) async {
    var response = await apiService.login(registerRequestModel);
    if (response.response.statusCode == 200) {
      return response.data;
    }
  }

  Future<dynamic> getUsers() async {
    var response = await apiService.getUsers();
    if (response.response.statusCode == 200) {
      return response.data;
    }
  }

  Future<dynamic> deleteUser(int id) async {
    var response = await apiService.deleteUser(id);
    if (response.response.statusCode == 204) {
      return response.data;
    }
  }

  Future<dynamic> createUser(
      UserUpdateRequestModel userUpdateRequestModel) async {
    var response = await apiService.createUser(userUpdateRequestModel);
    if (response.response.statusCode == 201) {
      return response.data;
    }
  }

  Future<dynamic> updateUser(
      int id, UserUpdateRequestModel userUpdateRequestModel) async {
    var response = await apiService.updateUser(id, userUpdateRequestModel);
    if (response.response.statusCode == 200) {
      return response.data;
    }
  }
}
