import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/theme/app_colors.dart';

class PrimaryAppButton extends StatelessWidget {
  final String text;

  const PrimaryAppButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 290,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(AppColors.primaryColor)),
      child: Center(
          child: Text(
        text,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      )),
    );
  }
}
