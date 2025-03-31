import 'package:smart_solutions_application/data/models/activity_model.dart';

abstract class EmployeeRepository {
  Future<List<Activity>> fetchActivities();
}
