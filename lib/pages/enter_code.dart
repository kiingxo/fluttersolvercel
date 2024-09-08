import 'package:flutter/material.dart';

class EnterCodePage extends StatefulWidget {
  const EnterCodePage({super.key});

  @override
  State<EnterCodePage> createState() => _EnterCodePageState();
}

class _EnterCodePageState extends State<EnterCodePage> {
  final TextEditingController _codeController = TextEditingController(); // To manage code input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        title: const Text(
          "Enter Java Code",
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        leading: IconButton(
          
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
            
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the text box
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10), // Space between text and input box
            Expanded(
              child: TextField(
                controller: _codeController,
                maxLines: null, // Allows for multiline input
                expands: true, // Allows the text box to expand and fill available space
                keyboardType: TextInputType.multiline,
                style: const TextStyle(color: Colors.white), // Input text color
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 50, 50, 50), // Background color of the input box
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10), // Space before buttons
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showErrorModal(context); // Show the error modal when pressed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color.fromARGB(255, 14, 83, 15), // Green background
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50, // Increased width
                    vertical: 20, // Rectangular height
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rectangular shape
                  ),
                ),
                child: const Text(
                  'Proceed',
                  style: TextStyle(
                    color: Colors.white, // White text for Start
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to display the error modal

}

  void showErrorModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 30, 29, 29),
          title: const Text("Error",style: TextStyle(color: Colors.white),),
          content: const Text("Error 407: Invalid hold code.",style: TextStyle(color: Colors.white),),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }