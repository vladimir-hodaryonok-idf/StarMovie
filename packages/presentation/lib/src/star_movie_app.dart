import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:presentation/src/app/data/app_data.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/style/color_scheme/dark.dart';
import 'package:presentation/generated/l10n.dart';
import 'app/app_bloc.dart';
import 'app/widgets/app_navigation_bar.dart';
import 'base_bloc/base_tile.dart';
import 'config_model/presentation_config.dart';

class StarMovieApp extends StatefulWidget {
  const StarMovieApp({
    required this.config,
    super.key,
  });

  final PresentationConfig config;

  @override
  State<StatefulWidget> createState() => _StarMovieAppState();
}

class _StarMovieAppState extends BlocScreenState<StarMovieApp, AppBloc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.config.title,
      theme: ThemeData.from(colorScheme: dark),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: StreamBuilder<BaseTile<AppData>>(
        stream: bloc.dataStream,
        builder: (context, snapshot) {
          final baseTile = snapshot.data;
          final tile = baseTile?.tile;
          if (tile == null || baseTile == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Scaffold(
            bottomNavigationBar: tile.isShowNavBar
                ? AppNavigationBar(
                    bloc: bloc,
                    bottomNavIndex: tile.bottomNavIndex,
                  )
                : null,
            body: Navigator(
              onPopPage: (route, result) {
                bloc.handleRemoveRouteSettings(route.settings);
                return route.didPop(result);
              },
              pages: tile.pages.toList(),
            ),
          );
        },
      ),
    );
  }
}
