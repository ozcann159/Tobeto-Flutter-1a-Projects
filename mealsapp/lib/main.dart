import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp/screens/categories.dart';

final theme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Color.fromARGB(255, 212, 212, 30),
  ),
).copyWith(
  useMaterial3: true,
);

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Color.fromARGB(255, 212, 212, 30),
        ),
      ).copyWith(
        useMaterial3: true,
      ),
      home: Categories(),
    ),
  ));
}
