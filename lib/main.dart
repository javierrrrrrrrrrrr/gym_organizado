import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gym_organizado/UI/Screens/loginPage.dart';

import 'Constants/themeData.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tema = CustomTheme.imputTheme(Get.width);
    return MaterialApp(
      title: 'Material App',
      home: const LoginPage(),
      theme: tema,
    );
  }
}
