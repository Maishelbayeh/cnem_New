import 'package:cenem/model/roleclaimModel.dart';

class Role {
  final String roleName;
  final String roleId;
  List<Claims>? claims;

  Role({
    required this.roleName,
    required this.roleId,
    this.claims,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
        roleName: json['name'], roleId: json['id'], claims: json['claims']);
  }

  Map<String, dynamic> toJson() {
    return {'name': roleName, 'id': roleId, 'claims': claims};
  }
}
