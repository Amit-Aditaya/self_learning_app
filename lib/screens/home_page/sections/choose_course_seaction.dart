import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/helpers/temp_info_holder.dart';
import 'package:self_learning_app/shared/widgets/alert_dialogs/course_alert_dialog.dart';
import 'package:self_learning_app/shared/widgets/buttons/secondary_app_button.dart';

class ChooseCourseSection extends StatefulWidget {
  const ChooseCourseSection({super.key});

  @override
  State<ChooseCourseSection> createState() => _ChooseCourseSectionState();
}

class _ChooseCourseSectionState extends State<ChooseCourseSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: TempInfoHolder.course == null
          ? const EdgeInsets.only(bottom: 5)
          : const EdgeInsets.only(bottom: 35),
      color: Colors.transparent,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => CourseAlertDialog()).then((value) {
                setState(() {});
              });
            },
            child: const Center(
              child: SecondaryAppButton(text: 'Choose Course'),
            ),
          ),
          const SizedBox(height: 20),
          TempInfoHolder.course == null
              ? const Text('')
              : Text(
                  TempInfoHolder.course,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
        ],
      ),
    );
  }
}
