import 'package:flutter/material.dart';

import '../../app_colors.dart';

class YemiAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final String? title;
  final IconThemeData? iconTheme;
  final double? toolbarHeight;
  final Color? backgroundColor;
  final void Function()? onSkipPressed;
  final PreferredSizeWidget? bottom;
  final bool? centerTitle;
  final Brightness? brightness;
  final Widget? iconWidget;
  final Color? titleColor;
  final Widget? child;

  YemiAppBar({
    super.key,
    this.title,
    this.iconTheme,
    this.toolbarHeight,
    this.backgroundColor,
    this.onSkipPressed,
    this.bottom,
    this.centerTitle,
    this.brightness,
    this.iconWidget,
    this.titleColor,
    this.child,
  }) : preferredSize = const Size.fromHeight(50.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: child ??
          (title != null
              ? Text(
                  '$title',
                  style: TextStyle(
                    color: titleColor ?? AppColors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 24.0,
                  ),
                )
              : null),
      iconTheme: IconThemeData(color: titleColor),
      bottom: bottom,
      centerTitle: centerTitle,
      brightness: brightness,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor ?? AppColors.white,
      // shape: const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.circular(10),
      //   ),
      // ),
      actions: [
        if (child == null)
          IconButton(
            padding: EdgeInsets.zero,
            icon: iconWidget != null ? iconWidget! : const SizedBox(height: 40),
            onPressed: () {},
          ),
        if (onSkipPressed != null)
          IconButton(
            icon: const Icon(
              Icons.clear,
              color: AppColors.black,
            ),
            onPressed: onSkipPressed,
          )
      ],
    );
  }
}
