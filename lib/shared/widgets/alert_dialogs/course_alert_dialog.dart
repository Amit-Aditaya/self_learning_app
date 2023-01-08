import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_learning_app/helpers/temp_info_holder.dart';
import 'package:self_learning_app/screens/home_page/home_page.dart';

// List<String> courseList = [
//   'CSE 301',
//   'Algorithms asdasdasdasdodododododoasdasdas',
//   'Logic Design',
//   'Experimentation and Measurement  Lab',
//   'Software Systems Lab',
//   "Data Structures and Algorithms Lab",
//   'Database and Information Systems',
//   'Artificial Intelligence ',
//   'Database and Information Systems ',
//   'Implementation of Programming Languages ',
//   'Computer Architecture ',
//   'Computer Networks ',
//   'Operating Systems ',
// ];

class CourseAlertDialog extends StatelessWidget {
  CourseAlertDialog({super.key});

  //initalizing adatabase
  final db = FirebaseFirestore.instance.collection('Courses');

  @override
  Widget build(BuildContext context) {
    //converting database collections to list of data
    var stream = db
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

    return AlertDialog(
      title: const Text(
        'Choose a course',
        textAlign: TextAlign.center,
      ),
      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        width: double.maxFinite,
        child: StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          TempInfoHolder.course =
                              (snapshot.data as dynamic)[index]['course_name'];
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
                                    offset: const Offset(0, 2),
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(0.25))
                              ]),
                          child: Center(
                            child: Text(
                              //reading from database "course_name" field
                              (snapshot.data as dynamic)[index]['course_name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.green),
                );
              }
            }),
      ),
    );
  }
}
