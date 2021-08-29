import 'package:flutter/material.dart';

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
