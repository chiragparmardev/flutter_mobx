// ignore_for_file: library_private_types_in_public_api

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:task_29_5/dio/dioexception.dart';
import 'package:task_29_5/model/register/register_request_model.dart';
import 'package:task_29_5/repo/api_repository.dart';
import 'package:task_29_5/services/api_services.dart';
import 'package:task_29_5/widgets/toast.dart';

part "register_store.g.dart";

class RegisterStore = _RegisterStore with _$RegisterStore;

abstract class _RegisterStore with Store {
  final ApiRepository apiRepository;

  _RegisterStore(this.apiRepository);

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<dynamic> registerFun(RegisterRequestModel registerRequestModel) async {
    isLoading = true;
    errorMessage = null;
    try {
      final response = await apiRepository.register(registerRequestModel);
      final token = response['token'];
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: token);
      Utility.showErrorMessage("Register successfull");
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

final register = RegisterStore(ApiRepository(ApiService(Dio())));
