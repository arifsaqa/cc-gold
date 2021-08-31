// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:learnUI/constants/colors.dart';
// import 'package:learnUI/controllers/app_data/dataTreesController.dart';
// import 'package:learnUI/models/policy/policy.dart';
// import 'package:shimmer/shimmer.dart';

// class PolicyScreen extends StatefulWidget {
//   const PolicyScreen({Key? key}) : super(key: key);

//   @override
//   _PolicyScreenState createState() => _PolicyScreenState();
// }

// class _PolicyScreenState extends State<PolicyScreen> {
//   final controller = Get.find<DataTreeController>();
//   var _data = <Policy>[];
//   var loading = false;
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(Duration.zero, () {
//       _getPolicies();
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   _getPolicies() async {
//     setState(() {
//       loading = true;
//     });
//     await controller.getPolicies();
//     setState(() {
//       _data = controller.policies;
//     });
//     setState(() {
//       loading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget _buildPanel() {
//       return ExpansionPanelList(
//         expansionCallback: (int index, bool isExpanded) {
//           setState(() {
//             _data[index].isExpanded = !isExpanded;
//           });
//         },
//         children: _data.map<ExpansionPanel>((Policy item) {
//           return ExpansionPanel(
//             headerBuilder: (BuildContext context, bool isExpanded) {
//               return ListTile(
//                 title: Text(item.question!),
//               );
//             },
//             body: ListTile(
//               title: Text(item.an),
//               subtitle:
//                   const Text('To delete this panel, tap the trash can icon'),
//               // trailing: const Icon(Icons.delete),
//               // onTap: () {
//               //   setState(() {
//               //     _data.removeWhere(
//               //         (dynamic currentItem) => item == currentItem);
//               //   });
//             ),
//             isExpanded: item.isExpanded,
//           );
//         }).toList(),
//       );
//     }

//     return Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           title: Title(
//               color: Color(background),
//               child: Container(
//                 margin: EdgeInsets.only(left: 10),
//                 child: Text(
//                   "Grafik Emas",
//                   textScaleFactor: 1.0,
//                   style: TextStyle(fontFamily: "MetroBold"),
//                 ),
//               )),
//           automaticallyImplyLeading: false,
//           backgroundColor: Color(background),
//         ),
//         body: SingleChildScrollView(
//           child: Container(
//               // height: double.infinity,
//               // width: double.infinity,
//               child: Obx(() => controller.loading.value
//                   ? _buildPanel()
//                   : Container(
//                       width: double.infinity,
//                       child: ListView.builder(
//                           scrollDirection: Axis.vertical,
//                           shrinkWrap: true,
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount: 3,
//                           itemBuilder: (context, index) {
//                             return Shimmer(
//                                 gradient: LinearGradient(stops: [
//                                   0.4,
//                                   0.5,
//                                   0.6
//                                 ], colors: [
//                                   Color(lowerGradient),
//                                   Color(upperGradient),
//                                   Color(lowerGradient)
//                                 ]),
//                                 child: Container(
//                                   margin: EdgeInsets.symmetric(
//                                       vertical: 10, horizontal: 20),
//                                   width: 327,
//                                   height: 80,
//                                   decoration: BoxDecoration(
//                                       color: Color(background),
//                                       borderRadius: BorderRadius.circular(8)),
//                                 ));
//                           })))),
//         ));
//   }
// }
