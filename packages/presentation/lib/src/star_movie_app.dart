import 'package:flutter/material.dart';
import 'package:presentation/src/app/data/app_data.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/style/color_scheme/dark.dart';
import 'app/app_bloc.dart';
import 'app/widgets/app_navigation_bar.dart';
import 'base_bloc/base_tile.dart';

class StarMovieApp extends StatefulWidget {
  const StarMovieApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StarMovieAppState();
}

class _StarMovieAppState extends BlocScreenState<StatefulWidget, AppBloc> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Movie',
      theme: ThemeData.from(colorScheme: dark),
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
