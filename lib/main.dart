import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(GameStore());
}

class GameStore extends StatelessWidget {
  const GameStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameStore',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue, // tema utama biru
      ),
      home: const LoginPage(), // halaman pertama
    );
  }
}
