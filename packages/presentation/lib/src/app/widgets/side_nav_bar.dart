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
    final selectedColor = Theme.of(context).colorScheme.onPrimaryContainer;
    return !WidgetDisplayHelper.isBottomNavBarActive(context) && isShowNavBar
        ? NavigationRail(
            destinations: [
              NavigationDestination(
                imagePath: AssetsImages.movieReelIcon,
                selectedColor: selectedColor,
                labelStr: S.of(context).navBarFilms,
              ),
              NavigationDestination(
                imagePath: AssetsImages.alarmIcon,
                selectedColor: selectedColor,
                labelStr: S.of(context).navBarReminder,
              ),
              NavigationDestination(
                imagePath: AssetsImages.eventTicketIcon,
                selectedColor: selectedColor,
                labelStr: S.of(context).navBarTickets,
              ),
              NavigationDestination(
                imagePath: AssetsImages.singlePersonIcon,
                selectedColor: selectedColor,
                labelStr: S.of(context).navBarPersonal,
              ),
            ],
            selectedIndex: selectedIndex,
            onDestinationSelected: callback,
          )
        : SizedBox.shrink();
  }
}

class NavigationDestination extends NavigationRailDestination {
  final String imagePath;
  final Color selectedColor;
  final String labelStr;

  NavigationDestination({
    required this.imagePath,
    required this.selectedColor,
    required this.labelStr,
  }) : super(
          label: Text(labelStr),
          icon: SvgPicture.asset(imagePath),
          selectedIcon: SvgPicture.asset(
            imagePath,
            color: selectedColor,
          ),
        );
}
