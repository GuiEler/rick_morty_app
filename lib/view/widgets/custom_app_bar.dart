import 'package:flutter/material.dart';

import '../../res/theme/app_colors.dart';
import '../../utils/utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onPressed,
    this.actions,
    this.elevation = 0,
    this.bottom,
    this.size,
    this.backgroundColor,
    this.leadingIconColor,
    this.isLoadingStream,
    this.isLoading,
    this.leading,
  });

  final Widget? title;
  final Function()? onPressed;
  final List<Widget>? actions;
  final double elevation;
  final PreferredSizeWidget? bottom;
  final Size? size;
  final Color? backgroundColor;
  final Color? leadingIconColor;
  final Stream<bool>? isLoadingStream;
  final bool? isLoading;
  final Widget? leading;

  @override
  Widget build(BuildContext context) => StreamBuilder<bool>(
    stream: isLoadingStream,
    initialData: isLoading,
    builder: (context, isLoadingSnapshot) => AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: backgroundColor ?? AppColors.green400,
      leading:
          leading ??
          (Navigator.canPop(context)
              ? IconButton(
                  iconSize: 40,
                  icon: const Icon(Icons.chevron_left_rounded),
                  onPressed: (isLoadingSnapshot.data ?? false) ? () {} : onPressed ?? NavigationUtils.back,
                  splashRadius: 24,
                  padding: EdgeInsets.zero,
                  color: leadingIconColor ?? AppColors.neutral0,
                )
              : null),
      elevation: elevation,
      actions: actions,
      bottom: bottom,
    ),
  );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));
}
