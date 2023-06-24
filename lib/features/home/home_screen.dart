import 'package:bottom_nav_bar_with_badges/resources/durations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'components/common/badged_nav_bar_icon.dart';
import 'package:bottom_nav_bar_with_badges/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _buildNavBarsItems(),
      decoration: _buildNavBarDecoration(),
      screenTransitionAnimation: _buildScreenTransitionAnimation(),
      navBarStyle: NavBarStyle.style3,
    );
  }

  List<Widget> _buildScreens() {
    return [
      Screens.cartsScreen.getWidget(),
      Screens.notificationsScreen.getWidget(),
      Screens.favoritesScreen.getWidget(),
    ];
  }

  List<PersistentBottomNavBarItem> _buildNavBarsItems() {
    return [
      buildNavBarItem(
        iconData: Icons.shopping_cart,
        screen: Screens.cartsScreen,
      ),
      buildNavBarItem(
        iconData: Icons.notifications,
        screen: Screens.notificationsScreen,
      ),
      buildNavBarItem(
        iconData: Icons.favorite,
        screen: Screens.favoritesScreen,
      ),
    ];
  }

  PersistentBottomNavBarItem buildNavBarItem(
      {required IconData iconData, required Screens screen}) {
    return PersistentBottomNavBarItem(
      icon: BadgedNavBarIcon(
        iconData: iconData,
        screen: screen,
      ),
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: Colors.grey,
    );
  }

  NavBarDecoration _buildNavBarDecoration() {
    return NavBarDecoration(
      borderRadius: BorderRadius.circular(10.0),
      colorBehindNavBar: Colors.white,
    );
  }

  ScreenTransitionAnimation _buildScreenTransitionAnimation() {
    return const ScreenTransitionAnimation(
      // Screen transition animation on change of selected tab.
      animateTabTransition: true,
      curve: Curves.ease,
      duration: DurationItems.animationDuration(),
    );
  }
}
