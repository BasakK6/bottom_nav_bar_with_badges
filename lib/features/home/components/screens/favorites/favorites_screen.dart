import 'package:bottom_nav_bar_with_badges/features/home/components/common/count_change_button.dart';
import 'package:bottom_nav_bar_with_badges/resources/app_strings.dart';
import 'package:bottom_nav_bar_with_badges/screens.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: _buildButtons(),
      ),
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text(kFavoritesScreenTitle));

  Column _buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CountChangeButton(isIncrease: true, screen: Screens.favoritesScreen),
        CountChangeButton(isIncrease: false, screen: Screens.favoritesScreen),
      ],
    );
  }
}
