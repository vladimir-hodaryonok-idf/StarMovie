import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/generated/l10n.dart';
import 'package:presentation/utils/images_container.dart';
import 'package:presentation/utils/widget_display_helper.dart';

class SideNavigationBar extends StatelessWidget {
  const SideNavigationBar({
    required this.selectedIndex,
    required this.callback,
    required this.isShowNavBar,
    super.key,
  });

  final Function(int) callback;
  final int selectedIndex;
  final bool isShowNavBar;

  @override
  Widget build(BuildContext context) {
    return !WidgetDisplayHelper.isBottomNavBarActive(context) && isShowNavBar
        ? NavigationRail(
            destinations: [
              NavigationRailDestination(
                icon: SvgPicture.asset(AssetsImages.movieReelIcon),
                label: Text(S.of(context).navBarFilms),
                selectedIcon: SvgPicture.asset(
                  AssetsImages.movieReelIcon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              NavigationRailDestination(
                icon: SvgPicture.asset(AssetsImages.alarmIcon),
                label: Text(S.of(context).navBarReminder),
                selectedIcon: SvgPicture.asset(
                  AssetsImages.alarmIcon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              NavigationRailDestination(
                icon: SvgPicture.asset(AssetsImages.eventTicketIcon),
                label: Text(S.of(context).navBarTickets),
                selectedIcon: SvgPicture.asset(
                  AssetsImages.eventTicketIcon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
              NavigationRailDestination(
                icon: SvgPicture.asset(AssetsImages.singlePersonIcon),
                label: Text(S.of(context).navBarPersonal),
                selectedIcon: SvgPicture.asset(
                  AssetsImages.singlePersonIcon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: callback,
          )
        : SizedBox.shrink();
  }
}
