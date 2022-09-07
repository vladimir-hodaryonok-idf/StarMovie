import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/base_bloc/bloc_screen.dart';
import 'package:presentation/src/navigation/base_page.dart';
import 'package:presentation/src/pages/home_page/bloc/home_bloc.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_grid_item.dart';
import 'package:presentation/src/pages/home_page/widgets/movie_showing_status.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

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
        actions: [
          IconButton(
            onPressed: () {
              //todo action
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      body: StreamBuilder(
        stream: bloc.dataStream,
        builder: (context, snapShot) => Center(
          child: Column(
            children: [
              MovieShowingStatus(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 18.0,
                    right: 18.0,
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 1 / 2.1,
                    ),
                    itemCount: 8, //todo from apiList
                    itemBuilder: (context, index) {
                      return MovieGridItem();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
