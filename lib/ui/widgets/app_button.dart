import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onPressed;
  final double? height;
  final Color? backgroundColor;
  final Gradient? gradient;

  bool get enabled => onPressed != null;

  const AppButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.height,
    this.backgroundColor,
    this.gradient,
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
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            disabledBackgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.white,
            minimumSize: Size.fromHeight(height ?? 58),
          ),
          onPressed: onPressed,
          child: child),
    );
  }
}
