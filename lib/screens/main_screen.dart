import 'package:age_calculator_app/providers/day_provider.dart';
import 'package:age_calculator_app/providers/month_provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final currentDayString =
        ref.watch(dayProvider).replaceAll(RegExp(r"[^0-9]"), "");
    dayTextEditingController.text = currentDayString;
    final currentMonthString =
        ref.watch(monthProvider).replaceAll(RegExp(r"[^0-9]"), "");
    monthTextEditingController.text = currentMonthString;
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
                  const Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
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
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 64,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: "38",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    TextSpan(
                      text: " years",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 64,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: "3",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    TextSpan(
                      text: " months",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 64,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    height: 1,
                  ),
                  children: [
                    TextSpan(
                      text: "26",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    TextSpan(
                      text: " days",
                      style: TextStyle(
                        color: Colors.black,
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
    super.dispose();
  }

  void onTapArrow() {}
}
