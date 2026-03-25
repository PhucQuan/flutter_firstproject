import 'package:flutter/material.dart';
import 'screens/team_intro_screen.dart';
import 'screens/login_screen_new.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manager App - Bài tập tuần F02',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      // Bắt đầu từ trang giới thiệu nhóm
      home: const TeamIntroScreen(),
      // Hoặc bắt đầu từ trang login mới (bỏ comment dòng dưới)
      // home: const LoginScreenNew(),
    );
  }
}
