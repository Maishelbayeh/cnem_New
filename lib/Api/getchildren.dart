import 'package:cenem/main.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Assuming these packages are available in your project
import 'package:cenem/model/childrenModel.dart';
import 'package:cenem/res/variables.dart';

String? key = apiKey;

class ApiService {
  static const String _baseUrl =
      'https://cnem.online/BE/api/Members/GetOffspringMembers';

  static Future<List<Children>> getOffspringMembers(String authToken) async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'accept': 'text/plain',
        'Authorization': 'Bearer ${user.authToken ?? authtoken}',
        'X-Api-Key': '$key',
      },
    );

    if (response.statusCode == 200) {
      responseJsonchildren = mapJsonToChildren(response.body);
      childrenService.saveChildrenList(responseJsonchildren);
      getClassificationCounts(responseJsonchildren);

      return responseJsonchildren;
    } else if (response.statusCode == 401) {
      Get.offAllNamed('/Home');
      return responseJsonchildren;
    } else if (response.statusCode == 404 || response.statusCode == 403) {
      countOrange = 0; // encodeClassification 101
      countGreen = 0; // encodeClassification 100
      countRed = 0; // encodeClassification 103
      countBlack = 0; // encodeClassification 102
      countBlue = 0;
      responseJsonchildren = [];
      return responseJsonchildren;
    } else {
      throw Exception(
          'Failed to load offspring members: ${response.reasonPhrase}');
    }
  }
}

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   config = await Config.loadFromAsset();
//  ////print
// (config.apiBaseUrl);
//  ////print
// (config.apiProxyUrl);
//   baseurl = config.apiBaseUrl;

//   final result = await loginUser("younes.khdeir@gmail.com", "Asdf@2255", true);

//   try {
//    ////print
// (await fetchOffspringMembers(user.userId));
//     if (await fetchOffspringMembers(user.userId) != null) {
//      ////print
// ("object");
//       responseJsonchildren =
//           await ApiService.getOffspringMembers(authtoken!);

//       //getClassificationCounts(responseJsonchildren);
//     }
//   } catch (e) {
//    ////print
// (e);
//   }

//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Offspring Members'),
//         ),
//         body: Center(
//           child: NavigationTextButton(
//             onTap: (buttonPosition) {
//               showCustomDialogonetime();
//             },
//             text: "الدفع",
//           ),
//         ),
//       ),
//     );
//   }
// }
