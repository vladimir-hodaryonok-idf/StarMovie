import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:presentation/const/events_strings.dart';
import 'package:presentation/src/app/data/app_data.dart';
import 'package:presentation/src/base_bloc/bloc.dart';
import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:collection/collection.dart';
import 'package:presentation/src/pages/home_page/home.dart';
import 'package:presentation/src/pages/login_page/login.dart';

enum BottomNavBarItemType {
  home,
  tickets,
  notifications,
  login;

  static BottomNavBarItemType fromIndex(int index) =>
      BottomNavBarItemType.values[index];
}

abstract class AppBloc extends Bloc<BaseArguments, AppData> {
  factory AppBloc(
    LogButtonUseCase logButton,
    LogPageUseCase logPage,
  ) =>
      _AppBloc(
        logButton,
        logPage,
      );

  void handleRemoveRouteSettings(RouteSettings value);

  void onNavigationBarClicked(int index);
}

class _AppBloc extends BlocImpl<BaseArguments, AppData> implements AppBloc {
  final LogButtonUseCase logButton;
  final LogPageUseCase logPage;

  _AppBloc(
    this.logButton,
    this.logPage,
  ) : super(AppData.init());

  final bottomNavBarStack = {
    BottomNavBarItemType.home: () => Home.page(),
    BottomNavBarItemType.login: () => Login.page(),
  };

  @override
  void init() {
    super.init();
    _update();
    _initNavHandler();
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

  BasePage<BaseArguments>? _currentPage() => tile.pages.lastOrNull;

  void _update() {
    final currentPage = _currentPage();
    if (currentPage != null) {
      emit(data: tile.copyWith(isShowNavBar: currentPage.isShowNavBar));
      logPage(currentPage.name.valueOrEmpty);
    }
  }

  @override
  void onNavigationBarClicked(int index) {
    emit(data: tile.copyWith(bottomNavIndex: index));
    final type = BottomNavBarItemType.fromIndex(index);
    logButton(EventName.navBarBtn + type.name);
    final page = bottomNavBarStack[type]?.call();
    if (page == null) return;
    switch (type) {
      case BottomNavBarItemType.home:
        _popAllAndPush(page);
        break;
      case BottomNavBarItemType.login:
        _popAllAndPush(page);
        break;
      default:
        break;
    }
  }
}
