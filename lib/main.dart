import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:overbook/controller/collector.dart';
import 'package:overbook/widgets/homePage.dart';

import 'package:shared_preferences/shared_preferences.dart';

DataController controller = Get.put(DataController());

Future<void> main() async {
  await SharedPreferences.getInstance();
//  SharedPrefsJsonDemo();
//         await Hive.initFlutter();
//         Hive.registerAdapter(PostsModelAdapter());
//         Hive.registerAdapter(DateAdapter());
// await Hive.openBox<PostsModel>('data');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // title: 'overPYQ',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),

      home: Center(
          child: MyHomePage(
              // title: 'overPYQ',
              )),
    );
  }
}
