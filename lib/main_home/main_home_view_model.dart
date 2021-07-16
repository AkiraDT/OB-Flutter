import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainHomeScreenProvider = StateNotifierProvider<MainHomeViewModel, bool>(
    (ref) => MainHomeViewModel());

class MainHomeViewModel extends StateNotifier<bool> {
  MainHomeViewModel() : super(false);

  void handleSwitch() {
    state = !state;
  }
}
