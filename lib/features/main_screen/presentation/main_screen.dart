import 'package:flutter/material.dart';
import 'package:klick_counter_app/common/counter_provider.dart';
import 'package:klick_counter_app/common/timer_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);
    final timerProvider = Provider.of<TimerProvider>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Du hast den Kopf ${counterProvider.count} gedrückt.",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                if (timerProvider.isActive) {
                  counterProvider.increment();
                }
              },
              child: const Text("Hier klicken")),
          Text(
            "Timer : ${timerProvider.countdown} Sekunden",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onPressed: () {
                if (timerProvider.isActive) {
                  timerProvider.stop();
                } else {
                  timerProvider.startCountdown();
                }
              },
              child: Text(timerProvider.isActive ? "Stop" : "Start")),
          OutlinedButton(
              onPressed: () {
                counterProvider.reset();
                timerProvider.reset();
              },
              child: const Text("Reset"))
        ],
      ),
    );
  }
}
