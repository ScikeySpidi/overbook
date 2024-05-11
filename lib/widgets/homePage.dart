// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:overbook/widgets/contentsHome.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    super.key,
  });

  // final String title;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title:  const Text("overPYQ"),
      // ),
      body: Center(
        child: ContentsHome(),
      ),
    );
  }
}
