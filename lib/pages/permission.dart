// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// //import 'package:whatsapp_status_saver/screens/home_page.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:wasamplenew/pages/dashboard.dart';
// import 'package:wasamplenew/includes/myNavigationDrawer.dart';

// class StoragePermission extends StatefulWidget {
//   @override
//   _StoragePermissionState createState() => _StoragePermissionState();
// }

// class _StoragePermissionState extends State<StoragePermission> {
//   Future<int> storagePermissionChecker;

//   Future<int> checkStoragePermission() async {
//     final result = await PermissionHandler()
//         .checkPermissionStatus(PermissionGroup.storage);
//     setState(() {});
//     if (result.toString() == "PermissionStatus.granted") {
//       return 1;
//     }
//     storagePermissionChecker = requestStoragePermission();
//     setState(() {});

//     return 0;
//   }

//   Future<int> requestStoragePermission() async {
//     Map<PermissionGroup, PermissionStatus> result =
//         await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//     return result[PermissionGroup.storage].toString() ==
//             "PermissionStatus.granted"
//         ? 1
//         : 0;
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     storagePermissionChecker = (() async {
//       return await checkStoragePermission();
//     })();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: FutureBuilder(
//         future: storagePermissionChecker,
//         builder: (context, status) {
//           if (status.connectionState == ConnectionState.done) {
//             if (status.hasData) {
//               if (status.data == 1) {
//                 return MyHome();
//               } else {
//                 return Scaffold(
//                   body: Center(
//                     child: RaisedButton(
//                       color: Colors.teal,
//                       child: Text(
//                         "Allow storage Permission",
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                       onPressed: () {
//                         storagePermissionChecker = checkStoragePermission();

//                         setState(() {});
//                       },
//                     ),
//                   ),
//                 );
//               }
//             } else {
//               return Scaffold(
//                   body: Center(
//                 child: Text(
//                     'Something went wrong.. Please uninstall and Install Again'),
//               ));
//             }
//           } else {
//             return Scaffold(body: Center(child: CircularProgressIndicator()));
//           }
//         },
//       ),
//     );
//   }
// }

// class MyHome extends StatefulWidget {
//   @override
//   _MyHomeState createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
//       body: DashboardScreen(),
//     );
//   }
// }
