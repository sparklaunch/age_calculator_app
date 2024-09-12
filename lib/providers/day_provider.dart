import 'package:flutter_riverpod/flutter_riverpod.dart';

final dayProvider =
    StateNotifierProvider<DayNotifier, String>((ref) => DayNotifier());

class DayNotifier extends StateNotifier<String> {
  DayNotifier() : super("");
  void setValue(String string) {
    state = string;
  }
}
