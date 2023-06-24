import 'package:bottom_nav_bar_with_badges/features/home/components/common/count_change_button.dart';
import 'package:bottom_nav_bar_with_badges/resources/app_strings.dart';
import 'package:bottom_nav_bar_with_badges/screens.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Center(
        child: _buildButtons(),
      ),
    );
  }

  Column _buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CountChangeButton(isIncrease: true, screen: Screens.cartsScreen),
        CountChangeButton(isIncrease: false, screen: Screens.cartsScreen)
      ],
    );
  }

  AppBar _buildAppBar() => AppBar(title: const Text(kCartScreenTitle));
}
