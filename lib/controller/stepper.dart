import 'package:flutter/cupertino.dart';

class StepperController extends ChangeNotifier {
  int _step = 0;

  set step(int value) {
    _step = value;
    notifyListeners();
  }

  int get step => _step;

  void nextStep() {
    _step++;
    notifyListeners();
  }

  void previousStep() {
    _step--;
    notifyListeners();
  }
}

final stepperController = StepperController();
