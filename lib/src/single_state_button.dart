import 'package:flutter/material.dart';
import 'package:multi_state_button/multi_state_button.dart';

class SingleStateButton extends StatelessWidget {
  /// State for single state button
  final ButtonState buttonState;
  const SingleStateButton({Key? key, required this.buttonState})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: buttonState.onPressed,
        child: Container(
          width: buttonState.size?.width,
          height: buttonState.size?.height,
          color: buttonState.decoration == null ? buttonState.color : null,
          decoration: buttonState.decoration,
          alignment: buttonState.alignment,
          clipBehavior: buttonState.clipBehavior,
          foregroundDecoration: buttonState.foregroundDecoration,
          transform: buttonState.transform,
          transformAlignment: buttonState.transformAlignment,
          child: buttonState.textStyle != null
              ? DefaultTextStyle(
                  style: buttonState.textStyle!, child: buttonState.child)
              : buttonState.child,
        ));
  }
}
