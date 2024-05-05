import 'package:disease_detector/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        // scaffoldBackgroundColor: Colors.white70,
        appBarTheme: const AppBarTheme(
            titleTextStyle:
                TextStyle(overflow: TextOverflow.ellipsis, fontSize: 22),
            backgroundColor: Colors.green,
            iconTheme: IconThemeData(
                color: Colors.white) // Set the app bar background color
            ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
