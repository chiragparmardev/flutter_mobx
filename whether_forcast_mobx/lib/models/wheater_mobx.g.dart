// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wheater_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Wheater on _WheaterBase, Store {
  late final _$wheaterEnumAtom =
      Atom(name: '_WheaterBase.wheaterEnum', context: context);

  @override
  WheaterEnum get wheaterEnum {
    _$wheaterEnumAtom.reportRead();
    return super.wheaterEnum;
  }

  @override
  set wheaterEnum(WheaterEnum value) {
    _$wheaterEnumAtom.reportWrite(value, super.wheaterEnum, () {
      super.wheaterEnum = value;
    });
  }

  late final _$wheaterAtom =
      Atom(name: '_WheaterBase.wheater', context: context);

  @override
  String get wheater {
    _$wheaterAtom.reportRead();
    return super.wheater;
  }

  @override
  set wheater(String value) {
    _$wheaterAtom.reportWrite(value, super.wheater, () {
      super.wheater = value;
    });
  }

  late final _$degreeAtom = Atom(name: '_WheaterBase.degree', context: context);

  @override
  double get degree {
    _$degreeAtom.reportRead();
    return super.degree;
  }

  @override
  set degree(double value) {
    _$degreeAtom.reportWrite(value, super.degree, () {
      super.degree = value;
    });
  }

  late final _$urlAtom = Atom(name: '_WheaterBase.url', context: context);

  @override
  String get url {
    _$urlAtom.reportRead();
    return super.url;
  }

  @override
  set url(String value) {
    _$urlAtom.reportWrite(value, super.url, () {
      super.url = value;
    });
  }

  late final _$setWheaterEnumdelayAsyncAction =
      AsyncAction('_WheaterBase.setWheaterEnumdelay', context: context);

  @override
  Future<dynamic> setWheaterEnumdelay() {
    return _$setWheaterEnumdelayAsyncAction
        .run(() => super.setWheaterEnumdelay());
  }

  late final _$_WheaterBaseActionController =
      ActionController(name: '_WheaterBase', context: context);

  @override
  void getWheater(String value) {
    final _$actionInfo = _$_WheaterBaseActionController.startAction(
        name: '_WheaterBase.getWheater');
    try {
      return super.getWheater(value);
    } finally {
      _$_WheaterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeWhaterImage() {
    final _$actionInfo = _$_WheaterBaseActionController.startAction(
        name: '_WheaterBase.changeWhaterImage');
    try {
      return super.changeWhaterImage();
    } finally {
      _$_WheaterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
wheaterEnum: ${wheaterEnum},
wheater: ${wheater},
degree: ${degree},
url: ${url}
    ''';
  }
}
