import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_flutter/EX-1-START-CODE/providers/course_provider.dart';
import '../models/course.dart';
import 'course_screen.dart';

const Color mainColor = Colors.blue;

class CourseListScreen extends StatelessWidget {
  const CourseListScreen({super.key});
  
  @override
  Widget build(BuildContext context) {

    void editCourse(Course course) async {
    // print('Hello');  
    await Navigator.of(context).push<Course>(
      MaterialPageRoute(builder: (ctx) => CourseScreen(courseID: course.id)),
    );
  }
    var courseProvider=Provider.of<CourseProvider>(context); // provider accessor
    List<Course> courses= courseProvider.getCourse(); // get all course from rpovider
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('SCORE APP', style: TextStyle(color: Colors.white)),
      ),
      body: ListView.builder(
        itemCount:courses.length,
        itemBuilder:(ctx, index) {
            Course course = courses[index];
            return  Dismissible(
              key: Key(course.id),
              child: CourseTile(
                course: course,
                onEdit: editCourse,
              ),
            );
            }
      ),
    );
  }
  
}
class CourseTile extends StatelessWidget {
  const CourseTile({super.key, required this.course, required this.onEdit});

  final Course course;
  final Function(Course) onEdit;

  int get numberOfScores => course.scores.length;

  String get numberText {
    return course.hasScore ? "$numberOfScores scores" : 'No score';
  }

  String get averageText {
    String average = course.average.toStringAsFixed(1);
    return course.hasScore ? "Average : $average" : '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            onTap: () => onEdit(course),
            title: Text(course.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(numberText), Text(averageText)],
            ),
          ),
        ),
      ),
    );
  }
}
