import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/screens/home_page/home_page.dart';
import 'package:self_learning_app/shared/widgets/appbars/primary_appbar.dart';
import 'package:self_learning_app/shared/widgets/buttons/primary_app_button.dart';
import 'package:self_learning_app/shared/widgets/logos/sla_logo.dart';
import 'package:self_learning_app/shared/widgets/textfields/primary_textfield.dart';
import 'package:self_learning_app/theme/app_colors.dart';
import 'package:self_learning_app/theme/constants.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final idTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PrimaryAppbar(
        text: 'Login',
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const SlaLogo(),
            const SizedBox(height: AppConstants.bottomSpacing * 4),
            PrimaryTextfield(
                hintText: 'ID', textEditingController: idTextEditingController),
            const SizedBox(height: AppConstants.bottomSpacing),
            PrimaryTextfield(
                hintText: 'Password',
                textEditingController: passwordTextEditingController),
            const SizedBox(height: AppConstants.bottomSpacing * 2),
            InkWell(
              onTap: () {
                if (
                    //idTextEditingController.text == '1111111' &&
                    passwordTextEditingController.text == 'abc123') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Invalid Login Credentials',
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: const PrimaryAppButton(
                text: 'Confirm',
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
