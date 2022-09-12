import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/base_bloc/base_tile.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/widgets/home_error.dart';
import 'package:presentation/src/pages/home_page/widgets/home_loaded.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

import 'bloc/home_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const _routeName = '/HomePage';

  static page() => BasePage(
        key: const ValueKey(_routeName),
        name: _routeName,
        builder: (context) => const Home(),
      );

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BlocScreenState<Home, HomeBloc> {
  static const _title = 'Star Movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: sfProSemiBold24px),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              //todo action
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Center(
        child: StreamBuilder<BaseTile<HomePageData>>(
          stream: bloc.dataStream,
          builder: (context, snapShot) {
            final state = snapShot.data;
            final tile = state?.tile;
            if (state == null || tile == null)
              return SizedBox.shrink();
            if (state.errorMessage != null)
              return HomeError(
                tile: tile,
                bloc: bloc,
                state: state,
              );
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

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetsImages.movieReelIcon),
          label: 'Films',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetsImages.alarmIcon),
          label: 'Reminder',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetsImages.eventTicketIcon),
          label: 'Tickets',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(AssetsImages.singlePersonIcon),
          label: 'Personal',
        ),
      ],
    );
  }
}
