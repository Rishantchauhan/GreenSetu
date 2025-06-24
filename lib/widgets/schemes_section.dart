import 'package:flutter/material.dart';

class SchemesSection extends StatelessWidget {
  const SchemesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text("Schemes and Subsidies",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
