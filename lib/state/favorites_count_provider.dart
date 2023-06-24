import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesCountNotifier extends StateNotifier<int> {
  FavoritesCountNotifier(super.state);

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

final favoritesCountProvider =
    StateNotifierProvider<FavoritesCountNotifier, int>((ref) {
  return FavoritesCountNotifier(2);
});
