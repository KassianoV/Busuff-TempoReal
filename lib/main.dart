import 'package:flutter/material.dart';
import 'package:busuff_transporte/screens/login_screen.dart'; // Mude 'busuff_transporte' para o nome do seu projeto

void main() {
  runApp(const UffBusApp());
}

class UffBusApp extends StatelessWidget {
  const UffBusApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BusUFF Transporte',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: Color(0xFF0D1B2A), // Azul escuro UFF
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
