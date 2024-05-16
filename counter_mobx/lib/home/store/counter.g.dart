// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Counter on CounterBase, Store {
  late final _$numberAtom = Atom(name: 'CounterBase.number', context: context);

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$CounterBaseActionController =
      ActionController(name: 'CounterBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$CounterBaseActionController.startAction(
        name: 'CounterBase.increment');
    try {
      return super.increment();
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$CounterBaseActionController.startAction(
        name: 'CounterBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
number: ${number}
    ''';
  }
}
