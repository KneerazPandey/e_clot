import 'package:e_clot/core/theme/theme.dart';
import 'package:flutter/material.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final Widget? action;
  final Color? backgroundColor;
  final bool hideBack;
  final Widget? title;

  const BasicAppBar({
    super.key,
    this.action,
    this.height,
    this.backgroundColor,
    this.hideBack = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: true,
      toolbarHeight: height ?? 80,
      title: title,
      titleSpacing: 0,
      actions: [
        action ?? Container(),
      ],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    color: AppColors.secondBackground, shape: BoxShape.circle),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? 80);
}
