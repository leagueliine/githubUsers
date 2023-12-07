import 'package:crypto_count/modules/github/github_view.dart';
import 'package:crypto_count/modules/home/crypto_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Minha App',
      theme: ThemeData(
          // Defina o tema da sua aplicação
          ),
      home: const GithubUserView(),
    );
  }
}
