import 'package:flutter/material.dart';
import 'package:w6_flutter/EX-1-START-CODE/models/course.dart';
import 'package:w6_flutter/EX-1-START-CODE/repositories/course_mock_repositories.dart';
import 'package:w6_flutter/EX-1-START-CODE/repositories/couses_repository.dart';
import 'package:w6_flutter/EX-2-START-CODE/repository/mock_post_repository.dart';

class CourseProvider extends ChangeNotifier {
  final CousesRepository courseRepo;
  Course? currentCourse; // for tracking current course
  // provider constructor
  CourseProvider({required this.courseRepo});

  List<Course> getCourse() {
    return courseRepo.getCourse();
  }
  
  Course? getCoursefor(String courseID) {

    // compare course ID and find the matching one
    for (var course in courseRepo.getCourse()) {
      if (course.id == courseID) {
        return course;
      }
    }
    // If no then return null
    return null;
  }

  void addScore(Course course, CourseScore score) {
    courseRepo.addScore(course, score);
    notifyListeners();
  }
}
