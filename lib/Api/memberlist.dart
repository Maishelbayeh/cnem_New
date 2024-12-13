import 'dart:convert';
import 'package:cenem/model/member_model.dart';
import 'package:cenem/model/roleModel.dart';
import 'package:cenem/model/roleclaimModel.dart';
import 'package:cenem/res/variables.dart';
import 'package:http/http.dart' as http;

class ApimemberService {
  Future<List<Member>> getListMembers() async {
    final String url = 'https://cnem.online/BE/api/Members/GetListMembers';
    // Use the proxy URL if needed
    // final String url = '$_proxyUrl/Members/GetListMembers';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
          'Authorization': 'Bearer ${user.authToken ?? authtoken}',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Member> members =
            body.map((dynamic item) => Member.fromJson(item)).toList();
        return members;
      } else {
        throw Exception('Failed to load members');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Role>> getListRoles() async {
    final String url = 'https://cnem.online/BE/api/Administration/ListRoles';
    // Use the proxy URL if needed
    // final String url = '$_proxyUrl/Members/GetListMembers';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
          'Authorization': 'Bearer ${user.authToken ?? authtoken}',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Role> roles =
            body.map((dynamic item) => Role.fromJson(item)).toList();
        return roles;
      } else {
        throw Exception('Failed to load members');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<String>> getListUsersRoles(String roleId) async {
    final String url =
        'https://cnem.online/BE/api/Administration/GetRoles/$roleId';
    // Use the proxy URL if needed
    // final String url = '$_proxyUrl/Members/GetListMembers';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
          'Authorization': 'Bearer ${user.authToken ?? authtoken}',
        },
      );

      if (response.statusCode == 200) {
        // Decode the response body into a Map
        Map<String, dynamic> body = jsonDecode(response.body);

        // Extract the 'users' field and cast it as a List<String>
        List<String> users = List<String>.from(body['users']);

        return users;
      } else {
        throw Exception('Failed to load members');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Claims>> getListRolesClaims(String roleId) async {
    final String url =
        'https://cnem.online/BE/api/Administration/GetManageRoleClaims/$roleId';
    // Use the proxy URL if needed
    // final String url = '$_proxyUrl/Members/GetListMembers';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
          'Authorization': 'Bearer ${user.authToken ?? authtoken}',
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        List<dynamic> claimsJson = body['claims'];
        List<Claims> claimsList =
            claimsJson.map((dynamic item) => Claims.fromJson(item)).toList();

        return claimsList;
      } else {
        throw Exception('Failed to load members');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<List<Role>> getRolesInUser(String userId) async {
    final String url =
        'https://cnem.online/BE/api/Administration/GetRolesInUser/$userId/roles';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
          'Authorization': 'Bearer ${user.authToken ?? authtoken}',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        List<Role> roles =
            body.map((dynamic item) => Role.fromJson(item)).toList();
        return roles;
      } else {
        throw Exception('Failed to load roles for user');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> setRolesInUser(String userId, Role updatedRole) async {
    final String url =
        'https://cnem.online/BE/api/Administration/SetRolesInUser/$userId/roles';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'X-Api-Key': 'e7bba24d-32ed-42bb-833c-30c4eec9088d',
          'Authorization': 'Bearer ${user.authToken ?? authtoken}',
        },
        body:
            jsonEncode(updatedRole.toJson()), // Encode the role object to JSON
      );

      if (response.statusCode == 200) {
        print('Role updated successfully');
      } else {
        throw Exception('Failed to update role');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
