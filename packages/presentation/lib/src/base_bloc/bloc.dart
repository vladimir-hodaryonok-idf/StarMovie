import 'dart:async';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/navigation/app_navigator.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'base_tile.dart';
import 'package:needle_di/needle_di.dart';

abstract class Bloc<T extends BaseArguments, D> {
  Stream<BaseTile<D>> get dataStream;

  D get tile;

  void init();

  void initArgs(T args);

  void dispose();
}

abstract class BlocImpl<T extends BaseArguments, D> implements Bloc<T, D> {
  final _dataStream = StreamController<BaseTile<D>>();
  BaseTile<D> baseTile = BaseTile.init();
  D _blocTile;

  @protected
  final appNavigator = Needle.instance.get<AppNavigator>();

  BlocImpl(this._blocTile);

  @override
  D get tile => _blocTile;

  @override
  Stream<BaseTile<D>> get dataStream => _dataStream.stream;

  emit({
    D? data,
    bool? isLoading,
    AppException? exception,
  }) {
    if (data != null) _blocTile = data;
    baseTile = baseTile.copyWith(
      isLoading: isLoading,
      tile: data,
      exception: exception,
    );
    _dataStream.add(baseTile);
  }

  @override
  void init() {}

  @override
  void initArgs(T args) {}

  @override
  void dispose() {}
}
