import 'package:flutter/material.dart';

class DiseaseSection extends StatelessWidget {
  final VoidCallback onTap;

  DiseaseSection({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green[600],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(Icons.search, color: Colors.white),
            SizedBox(width: 10),
            Expanded(
              child: Text("Click here, upload or click a picture to get disease and cure",
                  style: TextStyle(color: Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
