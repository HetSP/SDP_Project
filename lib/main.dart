import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:bakery_project/services/controller.dart';
import 'package:bakery_project/pages/admin_additem.dart';
import 'package:bakery_project/pages/home.dart';
import 'package:bakery_project/pages/login.dart';
import 'package:bakery_project/pages/main.dart';
import 'package:bakery_project/pages/signup.dart';
import 'package:bakery_project/pages/users.dart';
import 'package:bakery_project/pages/cart.dart';
import 'package:get_storage/get_storage.dart';

// void main() async{
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHome(),
//     );
//   }
// }
//
// class MyHome extends StatefulWidget {
//   // const MyHome({Key? key}) : super(key: key);
//
//   @override
//   State<MyHome> createState() => _MyHomeState();
// }
//
// class _MyHomeState extends State<MyHome> {
//
//   final CollectionReference _users =
//       FirebaseFirestore.instance.collection('users');
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:StreamBuilder(
//         stream: _users.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot){
//           if(streamSnapshot.hasData){
//             return ListView.builder(
//                 itemCount: streamSnapshot.data!.docs.length,
//                 itemBuilder: (context, index){
//                   final DocumentSnapshot documentSnapshot = streamSnapshot.data!.docs[index];
//                   return Card(
//                     margin: const EdgeInsets.all(10),
//                     child: ListTile(
//                       title: Text(documentSnapshot['username']),
//                       subtitle: Text(documentSnapshot['email'].toString())
//                     )
//                   );
//                 }
//             );
//           }
//           else{
//             return Text("Eror");
//           }
//         },
//       )
//     );
//   }
// }

Future<void> main() async {
  Get.testMode = true;
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final box = GetStorage();
  Controller ctrl = new Controller();


  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home:MyApp(),
    initialRoute: (ctrl.IsLoggedIn() == true)?'/home':'/login',
    // initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/mainPage': (context) => MainPage(),
      '/addItem': (context) => AddItem(),
      '/cart': (context) => Cart(),
      '/users': (context) => Users(),
    },
  ));
}