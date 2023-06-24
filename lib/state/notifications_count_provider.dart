import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsCountNotifier extends StateNotifier<int> {
  NotificationsCountNotifier(super.state);

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

final notificationsCountProvider =
    StateNotifierProvider<NotificationsCountNotifier, int>((ref) {
  return NotificationsCountNotifier(8);
});
