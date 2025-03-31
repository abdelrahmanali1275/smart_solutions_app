import 'package:smart_solutions_application/core/api/api_service.dart';
import 'package:smart_solutions_application/data/models/activity_model.dart';

class ActivityRepoImplementation {
  ApiService apiService = ApiService();

  Future<List<Activity>> fetchActivities() async {
    try {
      final response = await apiService.get('/client/activity');
      final List<dynamic> data = response.data['data'];
      return data.map((json) => Activity.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch activities: $e');
    }
  }
}
