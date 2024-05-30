// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:task_29_5/dio/dioexception.dart';
import 'package:task_29_5/model/register/register_request_model.dart';
import 'package:task_29_5/repo/api_repository.dart';
import 'package:task_29_5/services/api_services.dart';
import 'package:task_29_5/widgets/toast.dart';

part "login_store.g.dart";

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  final ApiRepository apiRepository;

  _LoginStore(this.apiRepository);

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<dynamic> login(RegisterRequestModel registerRequestModel) async {
    isLoading = true;
    errorMessage = null;
    try {
      final response = await apiRepository.login(registerRequestModel);
      final token = response['token'];
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token);
      Utility.showErrorMessage("Login successfull");
      return response;
    } on DioException catch (e) {
      errorMessage = DioExceptionUtil.handleError(e).toString();
      Utility.showErrorMessage(errorMessage.toString(), isError: true);
      throw DioExceptionUtil.handleError(e);
    } finally {
      isLoading = false;
    }
  }
}

final login = LoginStore(ApiRepository(ApiService(Dio())));
