import 'package:age_calculator_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp.router(
        theme: ThemeData(fontFamily: "Poppins"),
        routerConfig: router,
        title: "Age Calculator App",
      ),
    ),
  );
}
