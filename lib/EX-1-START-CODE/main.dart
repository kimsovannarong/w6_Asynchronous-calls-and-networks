import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_flutter/EX-1-START-CODE/providers/course_provider.dart';
import 'package:w6_flutter/EX-1-START-CODE/repositories/course_mock_repositories.dart';
import 'package:w6_flutter/EX-1-START-CODE/screens/course_list_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CourseProvider(courseRepo: CourseMockRepositories()), // to inject the mock repo to provider
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      home: CourseListScreen(),
    );
  }
}