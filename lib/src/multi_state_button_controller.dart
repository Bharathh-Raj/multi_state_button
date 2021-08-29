import 'package:flutter/foundation.dart';
import 'package:multi_state_button/multi_state_button.dart';

class MultiStateButtonController {
  /// Pass the [ButtonState.stateName] to set the initialState.
  MultiStateButtonController({required String initialStateName})
      : _buttonStateName = ValueNotifier(initialStateName);

  final ValueNotifier<String> _buttonStateName;
  ValueNotifier<String> get buttonStateName => _buttonStateName;

  /// Pass the [ButtonState.stateName] to set the current button state.
  set setButtonState(String stateName) => _buttonStateName.value = stateName;
}
