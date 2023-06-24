import 'package:bottom_nav_bar_with_badges/resources/edge_insets.dart';
import 'package:bottom_nav_bar_with_badges/screens.dart';
import 'package:bottom_nav_bar_with_badges/resources/app_strings.dart';
import 'package:bottom_nav_bar_with_badges/utility/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountChangeButton extends ConsumerWidget {
  const CountChangeButton({
    Key? key,
    required this.isIncrease,
    required this.screen,
  }) : super(key: key);

  final bool isIncrease;
  final Screens screen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.dynamicWidth(0.5),
      height: context.dynamicHeight(0.05),
      margin: const EdgeInsetItems.verticalEight(),
      child: ElevatedButton(
        onPressed: () {
          screen.changeNotificationCount(ref: ref, isIncrease: isIncrease);
        },
        child: Text(isIncrease ? kIncrease : kDecrease),
      ),
    );
  }
}
