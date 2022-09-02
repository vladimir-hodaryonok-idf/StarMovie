import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/text_styles/styles.dart';

const movieReelIcon = 'packages/presentation/assets/icons/event_ticket.svg';
const alarmIcon = 'packages/presentation/assets/icons/alarm.svg';
const eventTicketIcon = 'packages/presentation/assets/icons/event_ticket.svg';
const singlePersonIcon = 'packages/presentation/assets/icons/single.svg';

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
              icon: SvgPicture.asset(movieReelIcon), label: 'Films'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(alarmIcon), label: 'Reminder'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(eventTicketIcon), label: 'Tickets'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(singlePersonIcon), label: 'Personal'),
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
                      childAspectRatio: 1 / 2.1),
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

class MovieShowingStatus extends StatelessWidget {
  const MovieShowingStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: Color(0xff2C3F5B), //todo theme color
          border: Border.all(
            width: 1,
            color: Color(0xff2C3F5B),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 0, 4),
              child: StatusButton(
                text: 'Now Showing',
                isActive: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
              child: StatusButton(
                text: 'Coming Soon',
                isActive: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const playIcon = 'packages/presentation/assets/icons/play.svg';

class StatusButton extends StatelessWidget {
  const StatusButton({
    Key? key,
    required this.isActive,
    required this.text,
  }) : super(key: key);
  static const padding = 24;
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: MediaQuery.of(context).size.width / 2 - padding,
      decoration: isActive
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xffD9251D),
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          isActive ? SvgPicture.asset(playIcon) : SizedBox.shrink(),
          Text(
            text,
            style: sfProSemiBold14px,
          )
        ],
      ),
    );
  }
}

const testImage = 'packages/presentation/assets/test_images/john.png';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Image.asset(
            testImage,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          MovieStars(
            fullStarsCount: 4,
            isBigStar: false,
          ),
          MovieShortInfo(
            movieGenres: 'Action',
            movieName: 'John Wick',
            parentsGuide: 'R',
          ),
        ],
      ),
    );
  }
}

const emptyStar = 'packages/presentation/assets/icons/empty_star.svg';
const fullStar = 'packages/presentation/assets/icons/full_star.svg';
const maxFullStars = 5;

class MovieStars extends StatelessWidget {
  const MovieStars({
    Key? key,
    required this.fullStarsCount,
    required this.isBigStar,
  }) : super(key: key);
  final int fullStarsCount;
  final bool isBigStar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Container(
        height: isBigStar ? 30 : 14,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              fullStarsCount,
              (_) => Padding(
                padding: const EdgeInsets.all(2.0),
                child: SvgPicture.asset(
                  fullStar,
                  height: isBigStar ? 20 : 14,
                  width: isBigStar ? 20 : 14,
                ),
              ),
            ),
            ...List.generate(
              maxFullStars - fullStarsCount,
              (_) => SvgPicture.asset(
                emptyStar,
                height: isBigStar ? 20 : 14,
                width: isBigStar ? 20 : 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const ellipse = 'packages/presentation/assets/icons/ellipse.svg';

class MovieShortInfo extends StatelessWidget {
  const MovieShortInfo({
    Key? key,
    required this.movieGenres,
    required this.movieName,
    required this.parentsGuide,
  }) : super(key: key);
  final String movieName;
  final String movieGenres;
  final String parentsGuide;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              movieName,
              style: sfProSemiBold16px,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  movieGenres,
                  style: sfProSemiMedium12px50opacity,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: SvgPicture.asset(ellipse),
                ),
                Text(
                  '| $parentsGuide',
                  style: sfProSemiMedium12px50opacity,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
