import 'package:flutter/material.dart';

import '../multi_state_button.dart';
import 'multi_state_button_controller.dart';

class MultiStateButton extends StatefulWidget {
  /// List of button states.
  /// Note: Default initial State is the first button state.
  /// Can override this behaviour with [initialStateName] constructor parameter of [MultiStateButtonController].
  final List<ButtonState> buttonStates;

  /// Used to change the current state of the button
  final MultiStateButtonController multiStateButtonController;

  /// Transition duration between button state transition.
  /// Defaults to 500 milliseconds
  final Duration transitionDuration;

  /// Transition curve between button state transition.
  /// Defaults to [Curves.easeIn]
  final Curve transitionCurve;

  MultiStateButton({
    Key? key,
    required this.buttonStates,
    required this.multiStateButtonController,
    this.transitionDuration = const Duration(milliseconds: 500),
    this.transitionCurve = Curves.easeIn,
  }) : super(key: key);

  @override
  _MultiStateButtonState createState() => _MultiStateButtonState();
}

class _MultiStateButtonState extends State<MultiStateButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: widget.transitionDuration);
    _animation =
        CurvedAnimation(parent: _controller, curve: widget.transitionCurve);
    _controller.forward(from: 1);
    widget.multiStateButtonController.buttonStateName.addListener(() {
      _controller.forward(from: 0);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: widget.multiStateButtonController.buttonStateName,
      builder: (context, value, child) {
        final ButtonState currentButtonState = value.isEmpty
            ? widget.buttonStates.first
            : widget.buttonStates
                .firstWhere((element) => element.stateName == value);
        return GestureDetector(
          onTap: currentButtonState.onPressed,
          child: AnimatedContainer(
            width: currentButtonState.size?.width,
            height: currentButtonState.size?.height,
            color: currentButtonState.decoration == null
                ? currentButtonState.color
                : null,
            decoration: currentButtonState.decoration,
            alignment: currentButtonState.alignment,
            duration: widget.transitionDuration,
            curve: widget.transitionCurve,
            child: AnimatedDefaultTextStyle(
              duration: widget.transitionDuration,
              curve: widget.transitionCurve,
              // Default theme's text style uses textStyle with inherit is false. Passing it causeing error. Thus overriding it with inherit as true
              style:
                  currentButtonState.textStyle ?? const TextStyle(fontSize: 12),
              child: FadeTransition(
                opacity: _animation,
                child: currentButtonState.child,
              ),
            ),
            clipBehavior: currentButtonState.clipBehavior,
            foregroundDecoration: currentButtonState.foregroundDecoration,
            onEnd: currentButtonState.onAnimationEnd,
            transform: currentButtonState.transform,
            transformAlignment: currentButtonState.transformAlignment,
          ),
        );
      },
    );
  }
}
