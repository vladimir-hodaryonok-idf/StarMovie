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
  int _bottomNavIndex = 0;

  void _onBottomNavBarClick(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title, style: sfProSemiBold24px),
        centerTitle: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
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
            if (state == null || tile == null) return SizedBox.shrink();
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

  Container buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 1.0,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        onTap: _onBottomNavBarClick,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsImages.movieReelIcon),
            label: 'Films',
            activeIcon: SvgPicture.asset(
              AssetsImages.movieReelIcon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsImages.alarmIcon),
            label: 'Reminder',
            activeIcon: SvgPicture.asset(
              AssetsImages.alarmIcon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsImages.eventTicketIcon),
            label: 'Tickets',
            activeIcon: SvgPicture.asset(
              AssetsImages.eventTicketIcon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AssetsImages.singlePersonIcon),
            label: 'Personal',
            activeIcon: SvgPicture.asset(
              AssetsImages.singlePersonIcon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}
