import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/helpers/temp_info_holder.dart';
import 'package:self_learning_app/screens/login_page/login_page.dart';
import 'package:self_learning_app/theme/app_colors.dart';

class SignoutAlertDialogue extends StatelessWidget {
  const SignoutAlertDialogue({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Do you want to sign out ?'),
      content:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color(AppColors.primaryColor))),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => LoginPage())));

              TempInfoHolder.course = null;
              TempInfoHolder.topic = null;
            },
            child: const Text('Yes')),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color(AppColors.primaryColor))),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'))
      ]),
    );
  }
}
