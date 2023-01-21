import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/helpers/temp_info_holder.dart';

// List<String> topicList = [
//   'Algorithms and Complexity',
//   'Architecture and Organization',
//   'Computational Science',
//   'Discrete Structures',
//   'Graphics and Visualization',
//   'Human-Computer Interaction',
//   'Information Assurance and Security',
//   'Information Management ',
//   'Intelligent Systems',
//   'Networking and Communications',
//   'Operating Systems',
//   'Platform-based Development',
//   'Parallel and Distributed Computing',
//   'Programming Languages',
//   'Software Development Fundamentals',
//   'Software Engineering',
//   'Systems Fundamentals',
//   'Social Issues and Professional Practice',
// ];

class TopicAlertDialog extends StatelessWidget {
  TopicAlertDialog({super.key});

  final db = FirebaseFirestore.instance.collection('Topics');

  @override
  Widget build(BuildContext context) {
    var stream = db
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

    return AlertDialog(
      title: const Text(
        'Choose a Topic',
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: double.maxFinite,
        child: StreamBuilder<Object>(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: (snapshot.data as dynamic).length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          TempInfoHolder.topic =
                              (snapshot.data as dynamic)[index]['topic_name'];
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 10, top: 1),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(0, 2),
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Center(
                            child: Text(
                              (snapshot.data as dynamic)[index]['topic_name'],
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
      ),
    );
  }
}
