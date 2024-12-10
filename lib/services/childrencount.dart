import 'package:get_storage/get_storage.dart';

class ClassificationService {
  final GetStorage _storage = GetStorage();
  final String _key = 'classificationCounts';

  // Save the classification counts
  Future<void> saveClassificationCounts(
      Map<String, int> classificationCounts) async {
    await _storage.write(_key, classificationCounts);
  }

  // Load the classification counts
  Map<String, int>? loadClassificationCounts() {
    Map<String, dynamic>? storedData =
        _storage.read<Map<String, dynamic>>(_key);
    if (storedData != null) {
      return Map<String, int>.from(storedData);
    }
    return null;
  }

  // Clear the classification counts
  Future<void> clearClassificationCounts() async {
    await _storage.remove(_key);
  }
}
