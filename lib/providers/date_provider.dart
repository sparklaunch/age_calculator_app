import 'package:age_calculator_app/providers/day_provider.dart';
import 'package:age_calculator_app/providers/month_provider.dart';
import 'package:age_calculator_app/providers/year_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = Provider((ref) {
  final dayString = ref.watch(dayProvider);
  final monthString = ref.watch(monthProvider);
  final yearString = ref.watch(yearProvider);
  final day = int.tryParse(dayString) ?? 1;
  final month = int.tryParse(monthString) ?? 1;
  final year = int.tryParse(yearString) ?? 2000;
  final birthDate = DateTime(year, month, day);
  final now = DateTime.now();
  final duration = now.difference(birthDate);
  final totalDays = duration.inDays;
  final years = totalDays ~/ 365;
  final months = (totalDays % 365) ~/ 30;
  final days = ((totalDays % 365) % 30);
  return (years, months, days);
});
