import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/theme/app_colors.dart';

class PrimaryAppbar extends StatelessWidget with PreferredSizeWidget {
  const PrimaryAppbar({super.key, required this.text, this.action});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String text;
  final List<Widget>? action;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      centerTitle: true,
      backgroundColor: const Color(AppColors.primaryColor),
      elevation: 0,
      actions: action == null ? [] : [...action!],
    );
  }
}
