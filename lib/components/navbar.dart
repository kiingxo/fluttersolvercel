import 'package:flutter/material.dart';
import 'package:solanawallet/pages/homepage.dart';
import 'package:solanawallet/pages/mevbot_bot.dart';
import 'package:solanawallet/pages/recieve.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MyHomePage(),
    const MevBotPage(), 
    const RecievePage(), 
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 29, 28, 28),
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        onTap: (int mytappedindex) {
          setState(() {
            _currentIndex = mytappedindex;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: "Wallet",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: "Earn",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_upward),
            label: "Deposit",
          ),
        ],
      ),
      // Changes the body of the scaffold with respect to the current index
      body: _screens.elementAt(_currentIndex),
    );
  }
}