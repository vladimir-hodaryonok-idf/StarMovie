import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/pages/_templates/home_page/widgets/movie_grid_item.dart';
import 'package:presentation/src/pages/_templates/home_page/widgets/movie_showing_status.dart';
import 'package:presentation/style/text_styles/styles.dart';
import 'package:presentation/utils/images_container.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  static const title = 'Star Movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: sfProSemiBold24px),
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
            icon: SvgPicture.asset(Assets.movieReelIcon),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.alarmIcon),
            label: 'Reminder',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.eventTicketIcon),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(Assets.singlePersonIcon),
            label: 'Personal',
          ),
        ],
      ),
      body: Center(
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
    );
  }
}
