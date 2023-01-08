import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/screens/home_page/widgets/question_card.dart';
import 'package:self_learning_app/theme/app_colors.dart';
import 'package:self_learning_app/theme/constants.dart';

List<Map<String, dynamic>> questionList = [
  {'Tahmid': 'What is this?'},
  {'Kazi': 'help help'},
  {'Arman': 'Nooooooo'}
];

class HelpSection extends StatelessWidget {
  const HelpSection({super.key});

  @override
  Widget build(BuildContext context) {
    final db = FirebaseFirestore.instance.collection('Questions');

    var stream = db
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

    return Container(
      padding: const EdgeInsets.only(bottom: 100),
      width: double.infinity,
      color: Colors.white,
      child: Column(children: [
        const SizedBox(height: 24),
        const Text(
          'Previous Questions',
          style: TextStyle(fontSize: 24),
        ),
        const SizedBox(height: AppConstants.bottomSpacing * 2),
        StreamBuilder(
            stream: stream,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: List.generate(
                      snapshot.data!.length,
                      (index) => QuestionCard(
                            username: (snapshot.data as dynamic)[index]['u_id']
                                .toString(),
                            question: (snapshot.data as dynamic)[index]
                                ['question'],
                          )),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }))
      ]),
    );
  }
}
