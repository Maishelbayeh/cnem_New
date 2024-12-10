import 'package:cenem/model/childrenModel.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

class ChildrenService {
  final GetStorage _storage = GetStorage();

  // Key for storing children list in GetStorage
  final String _childrenKey = 'children_list';

  // Save the list of Children to GetStorage
  Future<void> saveChildrenList(List<Children> childrenList) async {
    String jsonStr =
        jsonEncode(childrenList.map((child) => child.toJson()).toList());
    await _storage.write(_childrenKey, jsonStr);
  }

  // Load the list of Children from GetStorage
  List<Children> loadChildrenList() {
    String? jsonStr = _storage.read<String>(_childrenKey);
    if (jsonStr != null) {
      return mapJsonToChildren(jsonStr);
    }
    return [];
  }

  // Clear the list of Children from GetStorage
  Future<void> clearChildrenList() async {
    await _storage.remove(_childrenKey);
  }
}
