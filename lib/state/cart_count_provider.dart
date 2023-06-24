import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartCountNotifier extends StateNotifier<int> {
  CartCountNotifier(super.state);

  void changeState(int newState) {
    state = newState;
  }

  void increaseState() {
    state++;
  }

  void decreaseState() {
    if (state == 0) {
      //don't go below 0 (no negative numbers)
      return;
    }
    state--;
  }
}

final cartCountProvider = StateNotifierProvider<CartCountNotifier, int>((ref) {
  return CartCountNotifier(10);
});
