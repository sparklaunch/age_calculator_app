import 'package:age_calculator_app/providers/date_provider.dart';
import 'package:age_calculator_app/providers/day_provider.dart';
import 'package:age_calculator_app/providers/month_provider.dart';
import 'package:age_calculator_app/providers/year_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  final dayTextEditingController = TextEditingController();
  final monthTextEditingController = TextEditingController();
  final yearTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final currentDayString =
        ref.watch(dayProvider).replaceAll(RegExp(r"[^0-9]"), "");
    dayTextEditingController.text = currentDayString;
    final currentMonthString =
        ref.watch(monthProvider).replaceAll(RegExp(r"[^0-9]"), "");
    monthTextEditingController.text = currentMonthString;
    final currentYearString =
        ref.watch(yearProvider).replaceAll(RegExp(r"[^0-9]"), "");
    yearTextEditingController.text = currentYearString;
    final duration = ref.watch(dateProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(30),
          padding: const EdgeInsets.all(30),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(100),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                spreadRadius: 10,
                blurRadius: 100,
                color: Colors.black12,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: dayTextEditingController,
                      onChanged: (value) {
                        ref.read(dayProvider.notifier).setValue(value);
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      decoration: const InputDecoration(
                        label: Text(
                          "DAY",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        hintText: "DAY",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        ref.read(monthProvider.notifier).setValue(value);
                      },
                      controller: monthTextEditingController,
                      decoration: const InputDecoration(
                        label: Text(
                          "MONTH",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        hintText: "MONTH",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      keyboardType: TextInputType.number,
                      controller: yearTextEditingController,
                      onChanged: (value) {
                        ref.read(yearProvider.notifier).setValue(value);
                      },
                      decoration: const InputDecoration(
                        label: Text(
                          "YEAR",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                          ),
                        ),
                        hintText: "YEAR",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  const Divider(
                    thickness: 2,
                    color: Colors.black12,
                  ),
                  InkWell(
                    onTap: onTapArrow,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                      padding: const EdgeInsets.all(20),
                      child: SvgPicture.asset("assets/images/Arrow.svg"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 64,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: duration.$1.toString(),
                      style: const TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    const TextSpan(
                      text: " years",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: -3,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 64,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: duration.$2.toString(),
                      style: const TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    const TextSpan(
                      text: " months",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: -3,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 64,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: duration.$3.toString(),
                      style: const TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    const TextSpan(
                      text: " days",
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: -3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    dayTextEditingController.dispose();
    monthTextEditingController.dispose();
    yearTextEditingController.dispose();
    super.dispose();
  }

  void onTapArrow() {}
}
