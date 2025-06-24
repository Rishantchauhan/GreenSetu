import 'package:flutter/material.dart';

class FeatureTiles extends StatelessWidget {
  final VoidCallback onMarketTap;
  final VoidCallback onNewsTap;

  const FeatureTiles({super.key, required this.onMarketTap, required this.onNewsTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onMarketTap,
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.currency_rupee, size: 40, color: Colors.blue),
                      Text("MARKET PRICES", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("Get current prices of all crops", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: onNewsTap,
              child: Card(
                color: Colors.amber,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.newspaper, size: 40, color: Colors.red),
                      Text("AGRO NEWS", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text("Get the latest in agriculture", textAlign: TextAlign.center),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
