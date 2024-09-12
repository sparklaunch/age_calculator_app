import 'package:flutter_riverpod/flutter_riverpod.dart';

final monthProvider =
    StateNotifierProvider<MonthNotifier, String>((ref) => MonthNotifier());

class MonthNotifier extends StateNotifier<String> {
  MonthNotifier() : super("");
  void setValue(String string) {
    state = string;
  }
}
