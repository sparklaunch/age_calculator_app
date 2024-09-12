import 'package:flutter_riverpod/flutter_riverpod.dart';

final yearProvider =
    StateNotifierProvider<YearNotifier, String>((ref) => YearNotifier());

class YearNotifier extends StateNotifier<String> {
  YearNotifier() : super("");
  void setValue(String string) {
    state = string;
  }
}
