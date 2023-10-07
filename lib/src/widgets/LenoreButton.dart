import 'package:flutter/material.dart';

import 'LenoreLoading.dart';

class LenoreButton extends StatelessWidget {
  final String caption;
  final Function()? onPressed;
  final IconData? icon;
  final bool isLoading;
  final Alignment textAlignment;
  final Color? backgroundColor;
  final List<BoxShadow>? boxShadow;
  final Color? captionColor;
  final Color? iconColor;

  LenoreButton({
    Key? key,
    required this.caption,
    this.onPressed,
    this.icon,
    this.isLoading = false,
    this.textAlignment = Alignment.center,
    this.backgroundColor,
    this.boxShadow,
    this.captionColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
          boxShadow: boxShadow ??
              [
                BoxShadow(color: Theme.of(context).shadowColor, blurRadius: 5, spreadRadius: 1),
              ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: this.isLoading
            ? Container(
                child: LenoreLoading(),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (this.icon != null)
                    Icon(
                      this.icon!,
                      color: iconColor ?? captionColor,
                    ),
                  if (this.icon != null) SizedBox(width: 8),
                  Text(
                    '$caption',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: captionColor ?? Theme.of(context).colorScheme.onPrimary),
                  ),
                ],
              ),
      ),
    );
  }
}
