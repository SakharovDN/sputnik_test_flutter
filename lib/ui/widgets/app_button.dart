import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final double? height;
  final Color? backgroundColor;
  final Gradient? gradient;
  final bool expandByWidth;

  bool get enabled => onPressed != null;

  const AppButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.height,
    this.backgroundColor,
    this.gradient,
    this.expandByWidth = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: enabled ? gradient : null,
        color: enabled ? backgroundColor ?? theme.primaryColor : Colors.grey,
        borderRadius: BorderRadius.circular(14),
      ),
      height: expandByWidth ? null : (height ?? 58),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.white,
            minimumSize: expandByWidth ? Size.fromHeight(height ?? 58) : null,
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}
