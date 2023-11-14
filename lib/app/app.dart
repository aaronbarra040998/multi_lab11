import 'package:flutter/material.dart';
import 'package:mi_tarea03_flutter/app/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF40B7AD);
    const textColor = Color(0xFF4A4A4A);
    const backgroundColor = Color.fromARGB(255, 0, 0, 0);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        scaffoldBackgroundColor: backgroundColor,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'CascadiaCode', // Establece la fuente 'Cascadia Code'
            fontSize: 16, // Tamaño de fuente
            color: textColor, // Color del texto
          ),
        ),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
