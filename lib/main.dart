import 'package:flutter/material.dart';
import 'package:solanawallet/components/navbar.dart';
import 'package:solanawallet/pages/homepage.dart';
import 'package:solanawallet/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Solana Wallet',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontWeight: FontWeight.bold),
          bodySmall: TextStyle(fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontWeight: FontWeight.bold),
          labelLarge: TextStyle(fontWeight: FontWeight.bold),
          labelMedium: TextStyle(fontWeight: FontWeight.bold),
          labelSmall: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
