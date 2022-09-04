import 'package:flutter/material.dart';
import 'package:presentation/src/app/data/app_data.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/home_page/home.dart';

abstract class AppBloc extends Bloc<AppData> {
  factory AppBloc() => _AppBloc();

  void handleRemoveRouteSettings(RouteSettings value);
}

class _AppBloc extends BlocImpl<AppData> implements AppBloc {
  _AppBloc() : super(AppData.init());

  @override
  void init() async {
    super.init();
    _initNavHandler();
    _update();
    _handleSplashScreen(
      Future.delayed(Duration(seconds: 3)),
      Home.page(),
    );
  }

  @override
  void handleRemoveRouteSettings(RouteSettings value) {
    tile.pages.remove(value);
    _update();
  }

  void _initNavHandler() {
    appNavigator.init(
      push: _push,
      popOldAndPush: _popOldAndPush,
      popAllAndPush: _popAllAndPush,
      pushPages: _pushPages,
      popAndPush: _popAndPush,
      popAllAndPushPages: _popAllAndPushPages,
      pop: _pop,
      maybePop: _maybePop,
      popUntil: _popUntil,
      handleSplashScreen: _handleSplashScreen,
      currentPage: _currentPage,
    );
  }

  void _push(BasePage<BaseArguments> page) {
    tile.pages.add(page);
    _update();
  }

  void _popAllAndPush(BasePage<BaseArguments> page) {
    tile.pages
      ..clear()
      ..add(page);
    _update();
  }

  void _popOldAndPush(BasePage<BaseArguments> page) {
    final oldIndex =
        tile.pages.indexWhere((element) => element.name == page.name);
    if (oldIndex != -1) tile.pages.removeAt(oldIndex);
    _push(page);
  }

  void _pushPages(List<BasePage<BaseArguments>> pages) {
    tile.pages.addAll(pages);
    _update();
  }

  void _popAndPush(BasePage<BaseArguments> page) {
    tile.pages.removeLast();
    _push(page);
  }

  void _popAllAndPushPages(List<BasePage<BaseArguments>> pages) {
    tile.pages
      ..clear()
      ..addAll(pages);
    _update();
  }

  void _pop() {
    tile.pages.removeLast();
    _update();
  }

  void _maybePop() {
    if (tile.pages.isNotEmpty) _pop();
  }

  void _popUntil(BasePage<BaseArguments> page) {
    final startIndex =
        tile.pages.indexWhere((element) => element.name == page.name) + 1;
    final endIndex = tile.pages.length;
    tile.pages.removeRange(startIndex, endIndex);
    _update();
  }

  Future<void> _handleSplashScreen(
    Future future,
    BasePage page,
  ) async {
    await future;
    _popAndPush(page);
  }

  BasePage<BaseArguments>? _currentPage() =>
      tile.pages.isNotEmpty ? tile.pages.last : null;

  void _update() => emit(data: tile);
}
