import 'package:expenseapp/pages/main_page.dart';
import 'package:flutter/material.dart';

ColorScheme lightColorsSheme = ColorScheme.fromSeed(seedColor: Colors.orange);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.orange, // Ana renk
          onPrimary: Colors.white, // Ana renk üzerindeki metin rengi
        ),
        // AppBar temaları
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor:
              const Color.fromARGB(255, 230, 107, 6), // AppBar'ın arkaplan rengi
          foregroundColor:
              const Color.fromARGB(255, 14, 60, 97), // AppBar üzerindeki metin rengi
        ),

        cardTheme: const CardTheme().copyWith(
          color: Colors.white, // Kartın arkaplan rengi
          margin: EdgeInsets.symmetric(
              horizontal: 20, vertical: 10), // Kartın kenar boşlukları
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 14, 60, 97),
                fontSize: 18,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
