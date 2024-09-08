import 'package:flutter/material.dart';

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
      Navigator.pop(context); // This will pop the current screen and go back to the previous one
    },
  ),
),
      body: Center(
        child: Text(
          
          "Activation fee required. Deposit to pay fees",
          style: TextStyle(color: Colors.red,fontSize: 18),
        ),
      ),
    );
  }
}
