import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/utils/images_container.dart';

class AppNavigationBar extends StatefulWidget {
  const AppNavigationBar({Key? key}) : super(key: key);

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}

class _AppNavigationBarState extends State<AppNavigationBar> {
  int _bottomNavIndex = 0;

  void _onBottomNavBarClick(int index) {
    setState(() {
      _bottomNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
