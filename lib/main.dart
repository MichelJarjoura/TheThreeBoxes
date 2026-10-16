import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sharpen/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ThreeBox',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
