import 'package:flutter/material.dart';

class profitpage extends StatefulWidget {
  const profitpage({Key? key}) : super(key: key);

  @override
  State<profitpage> createState() => _ProfitpageState();
}

class _ProfitpageState extends State<profitpage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Center(
          child: Text(
            'Profit',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(16.0),
              width: screenWidth * 0.9, 
              color: const Color.fromARGB(255, 244, 244, 244),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sold Quantity',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Purchase Quantity',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Spending',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Earning',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Card(
                  color: const Color.fromARGB(255, 251, 251, 252),
                  child: ListTile(
                    title: Text('Item $index',
                        style: const TextStyle(color: Color.fromARGB(255, 7, 7, 7))),
                    subtitle: Text('Date',
                        style: const TextStyle(color: Color.fromARGB(255, 13, 13, 13))),
                   // leading: const Icon(Icons.shopping_cart,
                     //   color: Color.fromARGB(255, 9, 8, 8)),
                  trailing: Text('Stall:no A2'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
