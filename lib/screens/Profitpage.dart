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
              color: Color.fromARGB(255, 159, 156, 156),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Sold Quantity',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 70),
                      Text(
                    'Purchase Quantity  ',
                    style: TextStyle(color: Colors.black),
                  ),

                    ],
                  ),
                  SizedBox(height: 10),
                   Row(
                    children: [
                      Text(
                        '5',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 200),
                      Text(
                    '10 ',
                    style: TextStyle(color: Colors.black),
                  ),

                    ],
                  ),
                  
                  Row(
                    children: [
                      Text(
                        'Spending(₹)',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 100),
                       Text(
                    'Earning(₹)',
                    style: TextStyle(color: Colors.black),
                  ),
                    ],
                  ),
                  SizedBox(height: 10),
                   Row(
                    children: [
                      Text(
                        '50',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 190),
                      Text(
                    '100',
                    style: TextStyle(color: Colors.black),
                  ),

                    ],
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
