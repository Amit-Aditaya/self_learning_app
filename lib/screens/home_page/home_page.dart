import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:self_learning_app/helpers/temp_info_holder.dart';
import 'package:self_learning_app/screens/home_page/sections/choose_course_seaction.dart';
import 'package:self_learning_app/screens/home_page/sections/choose_topic_section.dart';
import 'package:self_learning_app/screens/home_page/sections/help_section.dart';
import 'package:self_learning_app/screens/loading_page/loading_page.dart';
import 'package:self_learning_app/screens/login_page/login_page.dart';

import 'package:self_learning_app/shared/widgets/alert_dialogs/course_alert_dialog.dart';
import 'package:self_learning_app/shared/widgets/alert_dialogs/signout_alert_dialogue.dart';
import 'package:self_learning_app/shared/widgets/alert_dialogs/topic_alert_dialog.dart';
import 'package:self_learning_app/shared/widgets/appbars/primary_appbar.dart';
import 'package:self_learning_app/shared/widgets/buttons/app_floating_action_button.dart';
import 'package:self_learning_app/shared/widgets/buttons/primary_app_button.dart';
import 'package:self_learning_app/shared/widgets/buttons/secondary_app_button.dart';
import 'package:self_learning_app/shared/widgets/textfields/primary_textfield.dart';
import 'package:self_learning_app/theme/app_colors.dart';

import 'package:self_learning_app/theme/constants.dart';

final homePageScrollController = ScrollController();

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final questionTexteditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //init database
    final db = FirebaseFirestore.instance.collection('Questions');

    return Scaffold(
        appBar: PrimaryAppbar(
          text: 'Home',
          action: [
            Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: ((context) => const SignoutAlertDialogue()));
                    },
                    child: const Icon(Icons.logout)))
          ],
        ),
        body: SingleChildScrollView(
          controller: homePageScrollController,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  children: [
                    const SizedBox(height: AppConstants.bottomSpacing * 2),
                    const ChooseCourseSection(),
                    const ChooseTopicSection(),
                    const SizedBox(height: AppConstants.bottomSpacing),
                    PrimaryTextfield(
                      hintText: 'Ask a Question',
                      textEditingController: questionTexteditingController,
                    ),
                    const SizedBox(height: AppConstants.bottomSpacing * 2),
                    InkWell(
                        onTap: () async {
                          await db.doc().set({
                            'q_id': 3,
                            'question':
                                questionTexteditingController.text.trim(),
                            'u_id': 1111111,
                          }).then((value) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                'Question posted Successfully',
                                style: TextStyle(fontWeight: FontWeight.w500),
                                textAlign: TextAlign.center,
                              ),
                              backgroundColor: Colors.greenAccent,
                            ));
                          });
                        },
                        child: const PrimaryAppButton(text: 'Post Question')),
                  ],
                ),
              ),
              const HelpSection(),
            ],
          ),
        ),
        floatingActionButton: const AppFloatingActionButton());
  }
}
