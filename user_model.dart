import "school_model.dart";
import "course_model.dart";

class User {
  String firstName;
  String lastName;
  School school;
  List<Course> activeCourses;
  List<Course> inactiveCourses;
}