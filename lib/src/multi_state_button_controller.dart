import 'package:flutter/foundation.dart';

class MultiStateButtonController {
  MultiStateButtonController({required String initialStateName}) : _buttonStateName = ValueNotifier(initialStateName);

  final ValueNotifier<String> _buttonStateName;
  ValueNotifier<String> get buttonStateName => _buttonStateName;
  set setButtonState(String stateName) => _buttonStateName.value = stateName;
}
