// import 'package:cenem/view/intro/components/Icon.dart';
// import 'package:flutter/material.dart';
// import 'package:cenem/view%20model/getx_controllers/certification_controller.dart';
// import 'package:get/get.dart';
// import '../../res/constants.dart';
// import '../../view model/responsive.dart';
// import 'components/video_grid.dart';

// class Certifications extends StatelessWidget {
//   final controller = Get.put(CertificationController());
//   Certifications({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           if (Responsive.isDesktop(context))
//             Expanded(
//               child: Center(
//                 child: VideoContainer(
//                   height: 400,
//                   width: 800,
//                 ),
//               ),
//             ),
//           if (Responsive.isLargeMobile(context) || Responsive.isMobile(context))
//             Expanded(
//               child: Center(
//                 child: VideoContainer(
//                   height: 300,
//                   width: 400,
//                 ),
//               ),
//             ),
//           if (!Responsive.isDesktop(context) &&
//               !Responsive.isLargeMobile(context))
//             Expanded(
//               child: Center(
//                 child: VideoContainer(
//                   height: 400,
//                   width: 700,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
