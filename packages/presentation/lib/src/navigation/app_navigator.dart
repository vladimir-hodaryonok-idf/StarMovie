import 'package:presentation/src/navigation/base_arguments.dart';
import 'package:presentation/src/navigation/base_page.dart';

abstract class AppNavigator {
  void init({
    Function(BasePage page) push,
    Function(BasePage page) popOldAndPush,
    Function(BasePage page) popAllAndPush,
    Function(List<BasePage> pages) pushPages,
    Function(BasePage page) popAndPush,
    Function(List<BasePage> pages) popAllAndPushPages,
    Function() pop,
    Function() maybePop,
    Function(BasePage page) popUntil,
    BasePage? Function() currentPage,
  });

  void push(BasePage page);

  void popAllAndPush(BasePage page);

  void popOldAndPush(BasePage page);

  void pushPages(List<BasePage> pages);

  void popAndPush(BasePage page);

  void popAllAndPushPages(List<BasePage> pages);

  void pop();

  void maybePop();

  void popUntil(BasePage page);

  BasePage? currentPage();

  factory AppNavigator() => _AppNavigatorImpl();
}

class _AppNavigatorImpl implements AppNavigator {
  Function(BasePage page)? _push;
  Function(BasePage page)? _popOldAndPush;
  Function(BasePage page)? _popAllAndPush;
  Function(List<BasePage> pages)? _pushPages;
  Function(BasePage page)? _popAndPush;
  Function(List<BasePage> pages)? _popAllAndPushPages;
  Function()? _pop;
  Function()? _maybePop;
  Function(BasePage page)? _popUntil;
  BasePage? Function()? _currentPage;

  @override
  void init({
    Function(BasePage<BaseArguments> page)? push,
    Function(BasePage<BaseArguments> page)? popOldAndPush,
    Function(BasePage<BaseArguments> page)? popAllAndPush,
    Function(List<BasePage<BaseArguments>> pages)? pushPages,
    Function(BasePage<BaseArguments> page)? popAndPush,
    Function(List<BasePage<BaseArguments>> pages)? popAllAndPushPages,
    Function()? pop,
    Function()? maybePop,
    Function(BasePage<BaseArguments> page)? popUntil,
    BasePage<BaseArguments>? Function()? currentPage,
  }) {
    _push = push;
    _popOldAndPush = popOldAndPush;
    _popAllAndPush = popAllAndPush;
    _pushPages = pushPages;
    _popAndPush = popAndPush;
    _popAllAndPushPages = popAllAndPushPages;
    _pop = pop;
    _maybePop = maybePop;
    _popUntil = popUntil;
    _currentPage = currentPage;
  }

  @override
  void maybePop() => _maybePop?.call();

  @override
  void pop() => _pop?.call();

  @override
  void popAllAndPush(BasePage<BaseArguments> page) =>
      _popAllAndPush?.call(page);

  @override
  void popAllAndPushPages(List<BasePage<BaseArguments>> pages) =>
      _popAllAndPushPages?.call(pages);

  @override
  void popAndPush(BasePage<BaseArguments> page) => _popAndPush?.call(page);

  @override
  void popOldAndPush(BasePage<BaseArguments> page) =>
      _popOldAndPush?.call(page);

  @override
  void popUntil(BasePage<BaseArguments> page) => _popUntil?.call(page);

  @override
  void push(BasePage<BaseArguments> page) => _push?.call(page);

  @override
  void pushPages(List<BasePage<BaseArguments>> pages) =>
      _pushPages?.call(pages);

  @override
  BasePage<BaseArguments>? currentPage() => _currentPage?.call();
}
