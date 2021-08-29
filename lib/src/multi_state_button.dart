import 'package:flutter/material.dart';

/// This is the stateful widget that the main application instantiates.
class MultiStateButton extends StatelessWidget {
  final List<ButtonState> buttonStates;
  final MultiStateButtonController multiStateButtonController;
  final Duration animationDuration;
  final Curve animationCurve;

  MultiStateButton({
    Key? key,
    required this.buttonStates,
    required this.multiStateButtonController,
    this.animationDuration = const Duration(seconds: 1),
    this.animationCurve = Curves.easeIn,
  }) : super(key: key) {
    // multiStateButtonController._register(this.hashCode);
  }
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: multiStateButtonController.buttonStateName,
      builder: (context, value, child) {
        final ButtonState previousButtonState = buttonStates
            .firstWhere((element) => element.stateName == multiStateButtonController._previousButtonStateName);
        final ButtonState currentButtonState = buttonStates.firstWhere((element) => element.stateName == value);
        return InkWell(
          onTap: currentButtonState.onPressed,
          child: AnimatedContainer(
            padding: EdgeInsets.all(0),
            margin: EdgeInsets.all(0),
            width: currentButtonState.size?.width,
            height: currentButtonState.size?.height,
            color: currentButtonState.boxDecoration == null ? currentButtonState.color : null,
            decoration: currentButtonState.boxDecoration,
            alignment: currentButtonState.alignment,
            duration: animationDuration,
            curve: animationCurve,
            // child: currentButtonState.child,
            child: AnimatedDefaultTextStyle(
              duration: animationDuration,
              curve: animationCurve,
              style: currentButtonState.textStyle ?? TextStyle(),
              child: AnimatedCrossFade(
                crossFadeState: CrossFadeState.showSecond,
                duration: animationDuration,
                firstChild: previousButtonState.child,
                secondChild: currentButtonState.child,
                firstCurve: animationCurve,
                sizeCurve: animationCurve,
                secondCurve: animationCurve,
                reverseDuration: animationDuration,
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

class MultiStateButtonController {
  MultiStateButtonController({required String initialStateName})
      : _buttonStateName = ValueNotifier(initialStateName),
        _previousButtonStateName = initialStateName;

  String _previousButtonStateName;
  final ValueNotifier<String> _buttonStateName;
  ValueNotifier<String> get buttonStateName => _buttonStateName;
  set setButtonState(String stateName) {
    if (_buttonStateName.value != stateName) {
      _previousButtonStateName = _buttonStateName.value;
      _buttonStateName.value = stateName;
    }
  }

  // int? _hashCodeOfButton;
  // int? get isRegistered => _hashCodeOfButton;
  // void _register(int hashCode) {
  //   assert(_hashCodeOfButton == null || _hashCodeOfButton == hashCode,
  //       "MultiStateButtonController already registered with another MultiStateButton with hashCode $_hashCodeOfButton");
  //   _hashCodeOfButton = hashCode;
  // }
}

class ButtonState {
  final String stateName;
  final VoidCallback? onPressed;
  final Color color;
  final Widget child;
  final Size? size;
  final BoxDecoration? boxDecoration;
  final AlignmentGeometry alignment;
  final TextStyle? textStyle;
  final Matrix4? transform;
  final Clip clipBehavior;
  final Decoration? foregroundDecoration;
  final VoidCallback? onAnimationEnd;
  final AlignmentGeometry? transformAlignment;

  ButtonState({
    required this.stateName,
    this.onPressed,
    this.child = const SizedBox(),
    this.textStyle,
    this.size,
    this.color = Colors.blue,
    this.boxDecoration,
    this.alignment = Alignment.center,
    this.transform,
    this.clipBehavior = Clip.none,
    this.foregroundDecoration,
    this.onAnimationEnd,
    this.transformAlignment,
  });
}
