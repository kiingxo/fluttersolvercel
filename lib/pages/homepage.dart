import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:solanawallet/pages/actavationerror.dart';
import 'package:solanawallet/pages/enter_code.dart';
import 'package:solanawallet/pages/mevbot_bot.dart';
import 'package:solanawallet/pages/recieve.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isBalanceVisible = true;
  double solBalance = 11815.34; // User's SOL balance (in SOL)
  Timer? _timer;

  // List of coins to be displayed in the ListView
  List<Map<String, dynamic>> coins = [
    {
      'name': 'SOL',
      'amount': 11815.34, // Amount of SOL owned
      'price': 0,      // This will be updated with live price
    },
    {
      'name': 'WSOL',
      'amount': 0,     // Wrapped SOL amount (if any)
      'price': 0,      // This will be updated with live price
    },
  ];

  @override
  void initState() {
    super.initState();
    // Fetch live prices when the widget is loaded
    _fetchLivePrices();
    // Refresh prices every 1 minute
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _fetchLivePrices();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  // Method to fetch live prices from CoinGecko or another API
  Future<void> _fetchLivePrices() async {
    try {
      // API URL for getting live prices of SOL and WSOL in USD
      final url = Uri.parse(
          'https://api.coingecko.com/api/v3/simple/price?ids=solana,wrapped-solana&vs_currencies=usd');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          // Update SOL and WSOL prices from live data
          coins[0]['price'] = data['solana']['usd'];           // SOL price in USD
          coins[1]['price'] = data['wrapped-solana']['usd'];   // WSOL price in USD
        });
      } else {
        print('Failed to load prices');
      }
    } catch (e) {
      print('Error fetching prices: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the USD equivalent of SOL balance based on live price
    double usdEquivalent = solBalance * coins[0]['price'];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 29, 29),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 29, 29),
        leading: IconButton(
          onPressed: () {
         
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EnterCodePage()),
                        );
                   
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text(
            '3cXdmZiuKLjz5Y4XxdB77J1x6FZx....',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Balance',
                style: TextStyle(color: Colors.grey, fontSize: 25),
              ),
              const SizedBox(width: 8),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isBalanceVisible = !_isBalanceVisible;
                  });
                },
                icon: Icon(
                  _isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          _isBalanceVisible
              ? Text(
                  '\$${usdEquivalent.toStringAsFixed(2)} USD',
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 10),
          _isBalanceVisible
              ? Text(
                  '$solBalance SOL',
                  style: const TextStyle(color: Colors.grey, fontSize: 20),
                )
              : const Text(
                  '*********',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
          const SizedBox(height: 30),

          // Grid of circle avatars with icons and labels
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: GridView.count(
              crossAxisCount: 4, // 4 icons per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: [
               
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ActivationErrorPage()),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 80, 78, 78),
                        radius: 30,
                        child: Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Withdraw',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                // Receive icon and label
                 Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RecievePage()),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 80, 78, 78),
                        radius: 30,
                        child: Icon(Icons.call_received, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Receive',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                // Hold icon and label
                InkWell(
                    onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EnterCodePage()),
                        );
                      },
                  child: const Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 80, 78, 78),
                        radius: 30,
                        child: Icon(Icons.hourglass_bottom, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Hold',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                // Start icon and label
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MevBotPage()),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 80, 78, 78),
                        radius: 30,
                        child: Icon(Icons.play_arrow, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Start',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // ListView to display coins with live prices
Expanded(
  child: ListView.builder(
    itemCount: coins.length,
    itemBuilder: (context, index) {
      final coin = coins[index];
      final totalValue = coin['amount'] * coin['price'];

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          color: const Color.fromARGB(255, 50, 50, 50), // Set custom background color for the tile
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 80, 78, 78),
              child: (coin['name'] == 'SOL' || coin['name'] == 'WSOL')
                  ? Image.asset(
                      'assets/images/solana.jpg',
                      width: 35,
                      height: 35,
                    )
                  : Text(
                      coin['name'],
                      style: const TextStyle(color: Colors.white),
                    ),
            ),
            title: Text(
              '${coin['amount']} ${coin['name']}',
              style: const TextStyle(color: Colors.grey),
            ),
            subtitle: Text(
              '\$${coin['price'].toStringAsFixed(2)} USD',
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: Text(
              '\$${totalValue.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    },
  ),
)
        ],
      ),
    );
  }
}