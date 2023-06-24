import 'package:bottom_nav_bar_with_badges/features/home/components/screens/cart/cart_screen.dart';
import 'package:bottom_nav_bar_with_badges/features/home/components/screens/favorites/favorites_screen.dart';
import 'package:bottom_nav_bar_with_badges/features/home/components/screens/notifications/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bottom_nav_bar_with_badges/state/cart_count_provider.dart';
import 'package:bottom_nav_bar_with_badges/state/favorites_count_provider.dart';
import 'package:bottom_nav_bar_with_badges/state/notifications_count_provider.dart';

enum Screens {
  cartsScreen,
  notificationsScreen,
  favoritesScreen;

  Widget getWidget() {
    switch (this) {
      case Screens.cartsScreen:
        return const CartScreen();
      case Screens.notificationsScreen:
        return const NotificationsScreen();
      case Screens.favoritesScreen:
        return const FavoritesScreen();
    }
  }

  void changeNotificationCount(
      {required WidgetRef ref, required bool isIncrease}) {
    switch (this) {
      case Screens.cartsScreen:
        final cartCountNotifier = ref.read(cartCountProvider.notifier);
        isIncrease
            ? cartCountNotifier.increaseState()
            : cartCountNotifier.decreaseState();
        break;
      case Screens.notificationsScreen:
        final notificationsCountNotifier =
            ref.read(notificationsCountProvider.notifier);
        isIncrease
            ? notificationsCountNotifier.increaseState()
            : notificationsCountNotifier.decreaseState();
        break;
      case Screens.favoritesScreen:
        final favoritesCountNotifier =
            ref.read(favoritesCountProvider.notifier);
        isIncrease
            ? favoritesCountNotifier.increaseState()
            : favoritesCountNotifier.decreaseState();
        break;
    }
  }

  int getNotificationCount({required WidgetRef ref}) {
    switch (this) {
      case Screens.cartsScreen:
        return ref.watch(cartCountProvider);
      case Screens.notificationsScreen:
        return ref.watch(notificationsCountProvider);
      case Screens.favoritesScreen:
        return ref.watch(favoritesCountProvider);
    }
  }
}
