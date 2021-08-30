import 'package:flutter/material.dart';
import 'multi_state_button_controller.dart';

class ButtonState {
  /// This is the name used to identify the state of the button.
  /// This name is used to change the state using [MultiStateButtonController]
  final String stateName;
  final Widget child;
  final VoidCallback? onPressed;

  /// Size of the button
  final Size? size;

  /// Color of the button.
  /// This should be null if boxDecoration is not null.
  final Color color;

  /// Decorate the button with color, border radius, box shadow, gradient etc...
  final BoxDecoration? decoration;

  /// Used to align the child.
  /// Defaults to [Alignment.center]
  final AlignmentGeometry alignment;

  /// If descendant of the button is a Text child, this textStle is used to enable transition animtation between two states.
  final TextStyle? textStyle;

  /// The transformation matrix to apply before painting the button.
  final Matrix4? transform;

  /// The clip behavior when [decoration] is not null.
  final Clip clipBehavior;

  /// The decoration to paint in front of the child.
  final Decoration? foregroundDecoration;

  /// SubRoutine to run on transition animation ends.
  final VoidCallback? onAnimationEnd;

  /// The alignment of the child, relative to the size of the button, if [transform] is specified.
  /// When [transform] is null, the value of this property is ignored.
  final AlignmentGeometry? transformAlignment;

  /// Note: For better text transition between states,pass textStyle into [ButtonState.textStyle] property.
  const ButtonState({
    required this.stateName,
    this.child = const SizedBox(),
    this.onPressed,
    this.size,
    this.color = Colors.blue,
    this.decoration,
    this.alignment = Alignment.center,
    this.textStyle,
    this.transform,
    this.clipBehavior = Clip.none,
    this.foregroundDecoration,
    this.onAnimationEnd,
    this.transformAlignment,
  });
}
