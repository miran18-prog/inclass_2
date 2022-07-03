// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

// using Futures
class FutureScreenView extends StatelessWidget {
  const FutureScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Futures"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: waitForFiveSec(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Text("Done");
            }
          },
        ),
      ),
    );
  }

  waitForFiveSec() async {
    return await Future.delayed(Duration(seconds: 4)).then((value) => true);
  }
}
