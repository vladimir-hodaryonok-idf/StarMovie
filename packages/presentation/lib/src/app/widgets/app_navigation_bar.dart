import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/app/app_bloc.dart';
import 'package:presentation/utils/images_container.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    Key? key,
    required this.bottomNavIndex,
    required this.bloc,
  }) : super(key: key);
  final AppBloc bloc;
  final int bottomNavIndex;

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
        currentIndex: bottomNavIndex,
        onTap: bloc.bottomBarNavigation,
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
