// import 'package:flutter/material.dart';
// import 'package:w6_flutter/EX-1-START-CODE/screens/course_list_screen.dart';


// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,

//       home: CourseListScreen(),
//     );
//   }
// }
// for testing with ex2
// import 'package:flutter/material.dart';
// import 'repository/mock_post_repository.dart';
// import 'repository/post_repository.dart';
// import 'package:provider/provider.dart';

// import 'ui/providers/post_provider.dart';
// import 'ui/screens/post_screen.dart';

// void main() {
//   // 1- Create the repository
//   PostRepository postRepo = MockPostRepository();

//   // 2 - Run the UI
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => PostProvider(repository: postRepo),
//       child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
//     ),
//   );
