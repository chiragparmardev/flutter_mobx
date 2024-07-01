// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:task_29_5/dio/dioexception.dart';
import 'package:task_29_5/model/user/user_list_response_model.dart';
import 'package:task_29_5/model/user/user_update_request_model.dart';
import 'package:task_29_5/repo/api_repository.dart';
import 'package:task_29_5/services/api_services.dart';
import 'package:task_29_5/widgets/toast.dart';
part "user_store.g.dart";

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final ApiRepository apiRepository;

  _UserStore(this.apiRepository);

  @observable
  UserListResponseModel? userListResponseModel;

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  String? userFetchError;

  @action
  Future<void> fetchUser() async {
    isLoading = true;
    errorMessage = null;
    userFetchError = null;
    try {
      final response = await apiRepository.getUsers();
      userListResponseModel = UserListResponseModel.fromJson(response);
    } on DioException catch (e) {
      userFetchError = DioExceptionUtil.handleError(e).toString();
      throw DioExceptionUtil.handleError(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<dynamic> deleteUser(int id) async {
    isLoading = true;
    errorMessage = null;
    try {
      await apiRepository.deleteUser(id);
      Utility.showErrorMessage("User Deleted");
    } on DioException catch (e) {
      errorMessage = DioExceptionUtil.handleError(e).toString();
      Utility.showErrorMessage(errorMessage.toString(), isError: true);
      throw DioExceptionUtil.handleError(e);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<dynamic> createUser(
      UserUpdateRequestModel userUpdateRequestModel) async {
    isLoading = true;
    errorMessage = null;
    try {
      await apiRepository.createUser(userUpdateRequestModel);
      Utility.showErrorMessage("User Created");
    } on DioException catch (e) {
      errorMessage = DioExceptionUtil.handleError(e).toString();
      Utility.showErrorMessage(errorMessage.toString(), isError: true);
      throw DioExceptionUtil.handleError(e);
    } finally {
      isLoading = false;
    }
  }                                                                                                                                   

  @action
  Future<dynamic> updateUser(
      int id, UserUpdateRequestModel userUpdateRequestModel) async {
    isLoading = true;
    errorMessage = null;
    try {
      await apiRepository.updateUser(id, userUpdateRequestModel);
      Utility.showErrorMessage("User Updated");
    } on DioException catch (e) {
      errorMessage = DioExceptionUtil.handleError(e).toString();
      Utility.showErrorMessage(errorMessage.toString(), isError: true);
      throw DioExceptionUtil.handleError(e);
    } finally {
      isLoading = false;
    }
  }
}

final user = UserStore(ApiRepository(ApiService(Dio())));
