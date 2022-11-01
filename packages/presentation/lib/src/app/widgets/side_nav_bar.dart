import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/src/app/app_bloc.dart';
import 'package:presentation/utils/images_container.dart';

class SideNavigationBar extends StatelessWidget {
  const SideNavigationBar({
    required this.selectedIndex,
    required this.bloc,
    super.key,
  });

  final AppBloc bloc;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      destinations: [
        NavigationRailDestination(
          icon: SvgPicture.asset(AssetsImages.movieReelIcon),
          label: Text('Films'),
          selectedIcon: SvgPicture.asset(
            AssetsImages.movieReelIcon,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        NavigationRailDestination(
          icon: SvgPicture.asset(AssetsImages.alarmIcon),
          label: Text('Reminder'),
          selectedIcon: SvgPicture.asset(
            AssetsImages.alarmIcon,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        NavigationRailDestination(
          icon: SvgPicture.asset(AssetsImages.eventTicketIcon),
          label: Text('Tickets'),
          selectedIcon: SvgPicture.asset(
            AssetsImages.eventTicketIcon,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        NavigationRailDestination(
          icon: SvgPicture.asset(AssetsImages.singlePersonIcon),
          label: Text('Personal'),
          selectedIcon: SvgPicture.asset(
            AssetsImages.singlePersonIcon,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
      selectedIndex: selectedIndex,
      onDestinationSelected: bloc.navigationBar,
    );
  }
}
