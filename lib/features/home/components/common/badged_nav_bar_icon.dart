import 'package:bottom_nav_bar_with_badges/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BadgedNavBarIcon extends StatelessWidget {
  final IconData iconData;
  final Screens screen;

  const BadgedNavBarIcon(
      {super.key, required this.iconData, required this.screen});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kBottomNavigationBarHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(iconData),
          Consumer(builder: (context, ref, child) {
            final int notificationCount = screen.getNotificationCount(ref: ref);
            return notificationCount == 0
                ? const SizedBox.shrink()
                : _buildBadge(notificationCount, context);
          }),
        ],
      ),
    );
  }

  Positioned _buildBadge(
      int notificationCount, BuildContext context) {
    return Positioned(
      top: 0,
      right: 0,
      child: Container(
        width: 23,
        height: 23,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Colors.red),
        alignment: Alignment.center,
        child: _buildAutoSizedText(notificationCount, context),
      ),
    );
  }

  FittedBox _buildAutoSizedText(int notificationCount, BuildContext context) {
    return FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          '$notificationCount',
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: Colors.white),
        ),
      );
  }
}
