// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'help_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HelpState on _HelpStateBase, Store {
  final _$isUpdatingAtom = Atom(name: '_HelpStateBase.isUpdating');

  @override
  bool get isUpdating {
    _$isUpdatingAtom.reportRead();
    return super.isUpdating;
  }

  @override
  set isUpdating(bool value) {
    _$isUpdatingAtom.reportWrite(value, super.isUpdating, () {
      super.isUpdating = value;
    });
  }

  @override
  String toString() {
    return '''
isUpdating: ${isUpdating}
    ''';
  }
}
