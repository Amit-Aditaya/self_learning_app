import 'package:flutter/material.dart';
import 'package:self_learning_app/theme/app_colors.dart';

class QuestionCard extends StatelessWidget {
  final String username;
  final String question;

  const QuestionCard(
      {super.key, required this.username, required this.question});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 65,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 7.5),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(AppColors.questionCardColor),
      ),
      child: Row(children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.transparent,
            child: const Center(child: CircleAvatar()),
          ),
        ),
        Expanded(
          flex: 8,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.transparent,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                username,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                question,
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.black.withOpacity(.25),
                    fontWeight: FontWeight.w500),
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
