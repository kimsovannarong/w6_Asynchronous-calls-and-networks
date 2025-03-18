

import 'package:w6_flutter/EX-1-START-CODE/models/course.dart';

abstract class CousesRepository {
  List<Course> getCourse();
  void addScore(Course course,CourseScore score);
}