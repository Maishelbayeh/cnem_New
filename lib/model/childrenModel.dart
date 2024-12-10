import 'dart:convert';

import 'package:cenem/res/variables.dart';
import 'package:cenem/services/countsave.dart';

class Children {
  final int childrenId;
  final String childrenName;
  final String childrenToken;
  final String classification;
  final String classificationCurrentMonth;
  final bool status;
  final int encode;
  final int encodeMonthly;

  Children({
    required this.childrenId,
    required this.childrenName,
    required this.childrenToken,
    required this.classification,
    required this.classificationCurrentMonth,
    required this.status,
    required this.encode,
    required this.encodeMonthly,
  });

  factory Children.fromJson(Map<String, dynamic> json) {
    return Children(
      childrenId: json['memberId'],
      childrenName: json['memberName'],
      childrenToken: json['memberToken'],
      classification: json['classification'],
      classificationCurrentMonth: json['classificationCurrentMonth'],
      status: json['status'],
      encode: json['encodeClassification'],
      encodeMonthly: json['encodeClassificationCurrentMonth'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'memberId': childrenId,
      'memberName': childrenName,
      'memberToken': childrenToken,
      'classification': classification,
      'classificationCurrentMonth': classificationCurrentMonth,
      'status': status,
      'encodeClassification': encode,
      'encodeClassificationCurrentMonth': encodeMonthly,
    };
  }
}

List<Children> mapJsonToChildren(String jsonStr) {
  List<dynamic> jsonList = jsonDecode(jsonStr);
  return jsonList.map((json) => Children.fromJson(json)).toList();
}

Future<Map<String, int>> getClassificationCounts(
    List<Children> childrenList) async {
  countOrange = 0; // encodeClassification 101
  countGreen = 0; // encodeClassification 100
  countRed = 0; // encodeClassification 103
  countBlack = 0; // encodeClassification 102
  countBlue = 0; // encodeClassification 102
  for (var child in childrenList) {
    switch (child.encode) {
      case 101:
        countOrange++;
        break;
      case 100:
        countGreen++;
        break;
      case 103:
        countRed++;
        break;
      case 102:
        countBlack++;
        break;
      case 104:
        countBlue++;
        break;
    }
  }
  final countService = CountService();
  await countService.saveCounts(
    countOrange: countOrange,
    countGreen: countGreen,
    countRed: countRed,
    countBlack: countBlack,
    countBlue: countBlue,
  );

  return {
    'منتسب': countOrange,
    'عضو ملتزم': countGreen,
    'عضو موقوف': countRed,
    'عضو مفصول': countBlack,
    'عضو مميز': countBlue, // Make sure to include the countBlue label if needed
  };
}

void main() {
  String jsonStr = '''
  [
    {
      "memberId": 6,
      "memberName": "مي حسم شلباية",
      "memberToken": "AA00004",
      "encodeClassification": 101,
      "classification": "منتسب",
      "encodeClassificationCurrentMonth": 101,
      "classificationCurrentMonth": "منتسب",
      "status": true
    },
    {
      "memberId": 7,
      "memberName": "ميس حح مصري",
      "memberToken": "AA00006",
      "encodeClassification": 101,
      "classification": "منتسب",
      "encodeClassificationCurrentMonth": 101,
      "classificationCurrentMonth": "منتسب",
      "status": false
    }
  ]
  ''';

  List<Children> childrenList = mapJsonToChildren(jsonStr);
  getClassificationCounts(childrenList);
}
