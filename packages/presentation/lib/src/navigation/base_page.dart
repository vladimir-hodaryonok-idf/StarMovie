import 'package:flutter/material.dart';
import 'package:presentation/src/navigation/base_arguments.dart';

class BasePage<T extends BaseArguments> extends Page {
  const BasePage({
    required LocalKey key,
    required String name,
    required this.builder,
    this.showSlideAnim,
    T? arguments,
  }) : super(
          key: key,
          name: name,
          arguments: arguments,
        );

  final WidgetBuilder builder;
  final bool? showSlideAnim;

  @override
  Route createRoute(BuildContext context) => _AppRoute(
        builder: builder,
        settings: this,
        showSlideAnim: showSlideAnim == true,
      );

  @override
  String toString() => '$name';
}

class _AppRoute extends MaterialPageRoute {
  final bool showSlideAnim;

  _AppRoute({
    required builder,
    this.showSlideAnim = false,
    RouteSettings? settings,
  }) : super(
          builder: builder,
          settings: settings,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (!showSlideAnim) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    }

    return super.buildTransitions(
      context,
      animation,
      secondaryAnimation,
      child,
    );
  }
}
