import 'package:flutter/material.dart';
import 'package:self_learning_app/helpers/temp_info_holder.dart';
import 'package:self_learning_app/shared/widgets/alert_dialogs/topic_alert_dialog.dart';
import 'package:self_learning_app/shared/widgets/buttons/secondary_app_button.dart';

class ChooseTopicSection extends StatefulWidget {
  const ChooseTopicSection({super.key});

  @override
  State<ChooseTopicSection> createState() => _ChooseTopicSectionState();
}

class _ChooseTopicSectionState extends State<ChooseTopicSection> {
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
                  builder: (context) => TopicAlertDialog()).then((value) {
                setState(() {});
              });
            },
            child: const Center(
              child: SecondaryAppButton(text: 'Choose Topic'),
            ),
          ),
          const SizedBox(height: 20),
          TempInfoHolder.topic == null
              ? const Text('')
              : Text(
                  TempInfoHolder.topic,
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
