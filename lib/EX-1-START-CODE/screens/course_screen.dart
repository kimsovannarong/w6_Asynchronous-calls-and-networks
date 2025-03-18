import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:w6_flutter/EX-1-START-CODE/providers/course_provider.dart';
import 'package:w6_flutter/EX-1-START-CODE/screens/course_score_form.dart';
import '../models/course.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({required this.courseID,super.key});
  final String courseID;
  // List<CourseScore> get scores => widget.course.scores;

  void _addScore(BuildContext context) async {

    var courseProvider=Provider.of<CourseProvider>(context,listen: false);
    CourseScore? newScore = await Navigator.of(context).push<CourseScore>(
      MaterialPageRoute(builder: (ctx) => const CourseScoreForm()),
    );

    if (newScore != null) {
     var course=courseProvider.getCoursefor(courseID);
     courseProvider.addScore(course!, newScore);
    }
  }
   Color scoreColor(double score) {
    return score > 50 ? Colors.green : Colors.orange;
  }
  @override
  Widget build(BuildContext context) {
    var courseProvider=Provider.of<CourseProvider>(context);
    Course? course= courseProvider.getCoursefor(courseID); // get the course from it id
    List<CourseScore> scores=course!.scores; // get score from those course
    Widget content = const Center(child: Text('No Scores added yet.'));
    if (scores.isNotEmpty) {
      content = ListView.builder(
        itemCount: scores.length,
        itemBuilder:
            (ctx, index) => ListTile(
              title: Text(scores[index].studentName),
              trailing: Text(
                scores[index].studenScore.toString(),
                style: TextStyle(
                  color: scoreColor(scores[index].studenScore),
                  fontSize: 15,
                ),
              ),
            ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          course.name,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {_addScore(context);}, icon: const Icon(Icons.add)),
        ],
      ),
      body: content,
    );
  }
  
}

