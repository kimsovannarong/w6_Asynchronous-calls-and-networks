
import 'package:w6_flutter/EX-1-START-CODE/models/course.dart';
import 'package:w6_flutter/EX-1-START-CODE/repositories/couses_repository.dart';

class CourseMockRepositories extends CousesRepository {
  List<Course> courses=[
   Course(name: 'HTML'),
   Course(name: 'CSS'),
   Course(name: 'FLUTTER'),
   Course(name: 'DART')
  ];

  @override
  List<Course> getCourse() {
    return courses;
  }

  @override
  void addScore(Course course, CourseScore score) {
    for (var scoredCourse in courses){
      if(scoredCourse.id==course.id){
        course.addScore(score);
      }
    }
  }

}
// void main() {
//   CourseMockRepositories repo = CourseMockRepositories();

//   Course flutterCourse = repo.getCourse().firstWhere((c) => c.name == "Flutter");
//   Course newcourse = repo.getCourse().firstWhere((c) => c.name == "CSS");
//   // CourseScore score1 = CourseScore(studentName: "Alice", studentScore: 95);
//   CourseScore courseScore=CourseScore(studentName: 'Narong',studenScore: 100);
//   CourseScore courseScore2=CourseScore(studentName: 'NarongCSS',studenScore: 100);
//   repo.addScore(flutterCourse, courseScore);
//   repo.addScore(newcourse,courseScore2);
//   print("Flutter average score: ${flutterCourse.average}"); // Should print 95.0
//   print("CSS score:${newcourse.average}");
// }