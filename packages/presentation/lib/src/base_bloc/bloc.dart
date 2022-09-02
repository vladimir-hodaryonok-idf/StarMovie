import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/src/navigation/app_navigator.dart';
import 'base_tile.dart';

abstract class Bloc<T> {
  Stream<BaseTile<T>> get dataStream;

  T get tile;

  void init();

  void dispose();
}

abstract class BlocImpl<T> implements Bloc<T> {
  final _dataStream = StreamController<BaseTile<T>>();
  BaseTile<T> baseTile = BaseTile<T>.init();
  T _blocTile;

  @protected
  final appNavigator = GetIt.I.get<AppNavigator>();

  BlocImpl(this._blocTile);

  @override
  T get tile => _blocTile;

  @override
  Stream<BaseTile<T>> get dataStream => _dataStream.stream;

  emit({
    T? data,
    bool? isLoading,
  }) {
    if (data != null) _blocTile = data;
    baseTile = baseTile.copyWith(
      isLoading: isLoading,
      tile: data,
    );
    _dataStream.add(baseTile);
  }

  @override
  void init() {}

  @override
  void dispose() {}
}
