import 'package:flutter/material.dart';

import '../multi_state_button.dart';
import 'multi_state_button_controller.dart';

class MultiStateButton extends StatefulWidget {
  final List<ButtonState> buttonStates;
  final MultiStateButtonController multiStateButtonController;
  final Duration animationDuration;
  final Curve animationCurve;

  MultiStateButton({
    Key? key,
    required this.buttonStates,
    required this.multiStateButtonController,
    this.animationDuration = const Duration(milliseconds: 500),
    this.animationCurve = Curves.easeIn,
  }) : super(key: key);

  @override
  _MultiStateButtonState createState() => _MultiStateButtonState();
}

class _MultiStateButtonState extends State<MultiStateButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.animationDuration);
    _animation = CurvedAnimation(parent: _controller, curve: widget.animationCurve);
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
        final ButtonState currentButtonState = widget.buttonStates.firstWhere((element) => element.stateName == value);
        return GestureDetector(
          onTap: currentButtonState.onPressed,
          child: AnimatedContainer(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            width: currentButtonState.size?.width,
            height: currentButtonState.size?.height,
            color: currentButtonState.decoration == null ? currentButtonState.color : null,
            decoration: currentButtonState.decoration,
            alignment: currentButtonState.alignment,
            duration: widget.animationDuration,
            curve: widget.animationCurve,
            child: AnimatedDefaultTextStyle(
              duration: widget.animationDuration,
              curve: widget.animationCurve,
              style: currentButtonState.textStyle ?? TextStyle(fontSize: 12),
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
