import 'package:get_storage/get_storage.dart';

class CountService {
  final GetStorage _storage = GetStorage();
  final String _key = 'classificationCounts';

  Future<void> saveCounts({
    required int countOrange,
    required int countGreen,
    required int countRed,
    required int countBlack,
    required int countBlue,
  }) async {
    final counts = {
      'countOrange': countOrange,
      'countGreen': countGreen,
      'countRed': countRed,
      'countBlack': countBlack,
      'countBlue': countBlue,
    };
    await _storage.write(_key, counts);
  }

  Map<String, int>? loadCounts() {
    final storedData = _storage.read<Map<String, dynamic>>(_key);
    if (storedData != null) {
      return {
        'countOrange': storedData['countOrange'] as int,
        'countGreen': storedData['countGreen'] as int,
        'countRed': storedData['countRed'] as int,
        'countBlack': storedData['countBlack'] as int,
        'countBlue': storedData['countBlue'] as int,
      };
    }
    return null;
  }

  Future<void> clearCounts() async {
    await _storage.remove(_key);
  }
}
