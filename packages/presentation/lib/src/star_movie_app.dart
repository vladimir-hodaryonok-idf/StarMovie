import 'package:flutter/material.dart';
import 'package:presentation/src/app/data/app_data.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'app/app_bloc.dart';
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
      theme: ThemeData.dark(),
      home: StreamBuilder<BaseTile<AppData?>>(
        stream: bloc.dataStream,
        builder: (context, snapshot) {
          final baseTile = snapshot.data;
          final tile = baseTile?.tile;
          if (tile == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          return Navigator(
            onPopPage: (route, result) {
              bloc.handleRemoveRouteSettings(route.settings);
              return route.didPop(result);
            },
            pages: tile.pages.toList(),
          );
        },
      ),
    );
  }
}
