import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("24°C", style: TextStyle(fontSize: 36)),
          Text("Faridabad\nMist H:36° L:22°", style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["03-24", "03-25", "03-26", "03-27"].map((date) => Column(
              children: [
                Icon(Icons.wb_sunny, size: 30),
                Text(date),
              ],
            )).toList(),
          )
        ],
      ),
    );
  }
}
