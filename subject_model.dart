import "school_model.dart";
import "course_model.dart";

class Subject {
  String name;
  String abbreviation;
  School school;
  List<Course> activeCourses;
  List<Course> incactiveCourses;
}