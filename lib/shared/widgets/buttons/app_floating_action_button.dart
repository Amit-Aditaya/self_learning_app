import 'package:flutter/material.dart';
import 'package:self_learning_app/helpers/temp_info_holder.dart';
import 'package:self_learning_app/screens/home_page/home_page.dart';
import 'package:self_learning_app/theme/app_colors.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.transparent,
      elevation: 0,
      onPressed: () {
        if (TempInfoHolder.course != null && TempInfoHolder.topic != null) {
          homePageScrollController.animateTo(MediaQuery.of(context).size.height,
              duration: const Duration(milliseconds: 1500), curve: Curves.ease);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              'Please choose a Course and a Topic',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ));
        }
      },
      child: const Center(
        child: Icon(
          Icons.help,
          size: 60,
          color: Color(AppColors.primaryColor),
        ),
      ),
    );
  }
}
