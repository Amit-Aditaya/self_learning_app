import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/theme/app_colors.dart';

class PrimaryTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const PrimaryTextfield(
      {super.key, required this.hintText, required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 290,
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color(AppColors.primaryColor), width: 3),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        maxLines: 1,
        controller: textEditingController,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle:
                const TextStyle(color: Color(AppColors.disabledTextGrey))),
      ),
    );
  }
}
