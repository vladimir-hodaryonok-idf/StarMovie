import 'package:flutter/material.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/src/base_bloc/base_tile.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/widgets/empty_lists_state.dart';
import 'package:presentation/src/pages/home_page/widgets/home_error.dart';
import 'package:presentation/src/pages/home_page/widgets/home_loaded.dart';
import 'package:presentation/style/dimens.dart';
import 'package:presentation/style/text_styles/styles.dart';

import 'bloc/home_data.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  static const _routeName = '/HomePage';

  static page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const Home(),
        isShowNavBar: true,
      );

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BlocScreenState<Home, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).appTitle,
          style: sfProSemiBold24px,
        ),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: Dimens.size0,
        actions: [
          IconButton(
            onPressed: () {
              //todo implement
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Center(
        child: StreamBuilder<BaseTile<HomePageData>>(
          stream: bloc.dataStream,
          builder: (context, snapShot) {
            final state = snapShot.data;
            final tile = state?.tile;
            if (state == null || tile == null) return const SizedBox.shrink();
            if (state.exception != null) {
              return HomeError(
                tile: tile,
                bloc: bloc,
                state: state,
              );
            }
            if (isDataEmptyAndStateIsLoaded(tile, state))
              return EmptyListsState(bloc: bloc);
            return HomeBody(
              tile: tile,
              bloc: bloc,
              isLoading: state.isLoading,
            );
          },
        ),
      ),
    );
  }

  bool isDataEmptyAndStateIsLoaded(HomePageData tile, BaseTile state) =>
      tile.isDataEmpty && !state.isLoading;
}
