import 'package:age_calculator_app/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (context, state) => const MainScreen(),
    )
  ],
);
