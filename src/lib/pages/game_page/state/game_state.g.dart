// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GameState on _GameStateBase, Store {
  final _$isUpdatingAtom = Atom(name: '_GameStateBase.isUpdating');

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

  final _$boardSizeAtom = Atom(name: '_GameStateBase.boardSize');

  @override
  BoardSize get boardSize {
    _$boardSizeAtom.reportRead();
    return super.boardSize;
  }

  @override
  set boardSize(BoardSize value) {
    _$boardSizeAtom.reportWrite(value, super.boardSize, () {
      super.boardSize = value;
    });
  }

  final _$elapsedTimeStrAtom = Atom(name: '_GameStateBase.elapsedTimeStr');

  @override
  String get elapsedTimeStr {
    _$elapsedTimeStrAtom.reportRead();
    return super.elapsedTimeStr;
  }

  @override
  set elapsedTimeStr(String value) {
    _$elapsedTimeStrAtom.reportWrite(value, super.elapsedTimeStr, () {
      super.elapsedTimeStr = value;
    });
  }

  @override
  String toString() {
    return '''
isUpdating: ${isUpdating},
boardSize: ${boardSize},
elapsedTimeStr: ${elapsedTimeStr}
    ''';
  }
}
