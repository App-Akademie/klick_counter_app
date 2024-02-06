import 'package:flutter/material.dart';
import 'package:klick_counter_app/common/counter_provider.dart';
import 'package:klick_counter_app/common/timer_provider.dart';
import 'package:klick_counter_app/features/main_screen/presentation/main_screen.dart';
import 'package:provider/provider.dart';

class ClickCounterApp extends StatelessWidget {
  const ClickCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          ChangeNotifierProvider(create: (context) => TimerProvider())
        ],
        child: const MaterialApp(
          home: MainScreen(),
        ));
  }
}
