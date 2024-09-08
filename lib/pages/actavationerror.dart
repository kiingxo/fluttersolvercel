import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActivationErrorPage extends StatefulWidget {
  const ActivationErrorPage({super.key});

  @override
  State<ActivationErrorPage> createState() => _ActivationErrorPageState();
}

class _ActivationErrorPageState extends State<ActivationErrorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            context.pop(); // Use GoRouter's `pop` to navigate back
          },
        ),
      ),
      body: const Center(
        child: Text(
          "Activation fee required. Deposit to pay fees",
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
      ),
    );
  }
}