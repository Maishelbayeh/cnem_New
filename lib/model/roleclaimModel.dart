// "claimType": "string",
//  "claimValue": "string",
//  "isSelected": true

class Claims {
  final String claimType;
  final String claimValue;
  final bool isSelected;

  Claims(
      {required this.claimType,
      required this.claimValue,
      required this.isSelected});

  factory Claims.fromJson(Map<String, dynamic> json) {
    return Claims(
        claimType: json['claimType'],
        claimValue: json['claimValue'],
        isSelected: json['isSelected']);
  }

  Map<String, dynamic> toJson() {
    return {
      'claimType': claimType,
      'claimValue': claimValue,
      'isSelected': isSelected
    };
  }
}
