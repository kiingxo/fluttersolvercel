import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For clipboard functionality
import 'package:go_router/go_router.dart'; // Import GoRouter

class RecievePage extends StatefulWidget {
  const RecievePage({super.key});

  @override
  State<RecievePage> createState() => _RecievePageState();
}

class _RecievePageState extends State<RecievePage> {
  final String walletAddress = "3cXdmZiuKLjz5Y4XxdB77J1x6FZxDduAQwRtQqQGU8AF";

  void _copyAddress() {
    Clipboard.setData(ClipboardData(text: walletAddress)).then((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address copied to clipboard')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        title: const Text(
          "Deposit",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
          onPressed: () {
            context.pop(); // Use GoRouter's pop to handle back navigation
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // SOL Logo
            // Image.asset(
            //   'assets/images/solana.jpg',
            //   width: 100,
            //   height: 100,
            // ),
            // const SizedBox(height: 20),
            const Text(
              'SOL (Solana)',
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/wallet.jpg',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              walletAddress,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _copyAddress,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 60, 60, 60),
                padding: const EdgeInsets.symmetric(
                  horizontal: 45,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Copy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'This address can only accept assets on SOL (Solana). Sending any other types of token to this address will result in permanent loss.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}