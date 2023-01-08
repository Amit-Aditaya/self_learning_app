import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:self_learning_app/firebase_options.dart';
import 'package:self_learning_app/screens/home_page/home_page.dart';
import 'package:self_learning_app/screens/login_page/login_page.dart';
import 'package:self_learning_app/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //  primarySwatch: Color(0xff9FE2BF),
        primaryColor: const Color(AppColors.primaryColor),
      ),
      home: LoginPage(),
    );
  }
}
