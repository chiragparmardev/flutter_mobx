// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  late final _$userListResponseModelAtom =
      Atom(name: '_UserStore.userListResponseModel', context: context);

  @override
  UserListResponseModel? get userListResponseModel {
    _$userListResponseModelAtom.reportRead();
    return super.userListResponseModel;
  }

  @override
  set userListResponseModel(UserListResponseModel? value) {
    _$userListResponseModelAtom.reportWrite(value, super.userListResponseModel,
        () {
      super.userListResponseModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_UserStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_UserStore.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$userFetchErrorAtom =
      Atom(name: '_UserStore.userFetchError', context: context);

  @override
  String? get userFetchError {
    _$userFetchErrorAtom.reportRead();
    return super.userFetchError;
  }

  @override
  set userFetchError(String? value) {
    _$userFetchErrorAtom.reportWrite(value, super.userFetchError, () {
      super.userFetchError = value;
    });
  }

  late final _$fetchUserAsyncAction =
      AsyncAction('_UserStore.fetchUser', context: context);

  @override
  Future<void> fetchUser() {
    return _$fetchUserAsyncAction.run(() => super.fetchUser());
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('_UserStore.deleteUser', context: context);

  @override
  Future<dynamic> deleteUser(int id) {
    return _$deleteUserAsyncAction.run(() => super.deleteUser(id));
  }

  late final _$createUserAsyncAction =
      AsyncAction('_UserStore.createUser', context: context);

  @override
  Future<dynamic> createUser(UserUpdateRequestModel userUpdateRequestModel) {
    return _$createUserAsyncAction
        .run(() => super.createUser(userUpdateRequestModel));
  }

  late final _$updateUserAsyncAction =
      AsyncAction('_UserStore.updateUser', context: context);

  @override
  Future<dynamic> updateUser(
      int id, UserUpdateRequestModel userUpdateRequestModel) {
    return _$updateUserAsyncAction
        .run(() => super.updateUser(id, userUpdateRequestModel));
  }

  @override
  String toString() {
    return '''
userListResponseModel: ${userListResponseModel},
isLoading: ${isLoading},
errorMessage: ${errorMessage},
userFetchError: ${userFetchError}
    ''';
  }
}
