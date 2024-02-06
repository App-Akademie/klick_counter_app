import 'dart:async';

import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  var countdown = 10;
  Timer? _timer;

  bool get isActive => _timer?.isActive ?? false;

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown == 0) {
        _timer?.cancel();
        notifyListeners();
        return;
      }

      countdown--;
      notifyListeners();
    });
  }

  void stop() {
    _timer?.cancel();
    notifyListeners();
  }

  void reset() {
    countdown = 10;
    notifyListeners();
  }
}
