import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.label,
      this.onTap,
      this.backgroundColor,
      this.labelColor});

  final String label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoTheme(
        data: CupertinoThemeData(
          primaryColor: backgroundColor ?? Colors.white,
        ),
        child: CupertinoButton.filled(
          padding: const EdgeInsets.symmetric(vertical: 19),
          onPressed: onTap,
          borderRadius: BorderRadius.circular(11),
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: labelColor,
                ),
          ),
        ),
      ),
    );
  }
}
