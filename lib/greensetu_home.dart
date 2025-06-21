import 'package:flutter/material.dart';
import 'widgets/weather_card.dart';
import 'widgets/feature_tiles.dart';
import 'widgets/disease_section.dart';
import 'widgets/schemes_section.dart';

class GreenSetuHome extends StatefulWidget {
  @override
  _GreenSetuHomeState createState() => _GreenSetuHomeState();
}

class _GreenSetuHomeState extends State<GreenSetuHome> {
  bool isEnglish = true;

  void toggleLanguage() => setState(() => isEnglish = !isEnglish);
  void openMarketPrices() => print("Market Prices Clicked");
  void openAgroNews() => print("Agro News Clicked");
  void openDiseaseRecognition() => print("Disease Recognition Clicked");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: Text('GreenSetu', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: toggleLanguage,
              child: Row(
                children: [
                  Text("ENG", style: TextStyle(color: isEnglish ? Colors.white : Colors.white60)),
                  Switch(value: isEnglish, onChanged: (_) => toggleLanguage()),
                  Text("हिंदी", style: TextStyle(color: !isEnglish ? Colors.white : Colors.white60)),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WeatherCard(),
            FeatureTiles(
              onMarketTap: openMarketPrices,
              onNewsTap: openAgroNews,
            ),
            DiseaseSection(onTap: openDiseaseRecognition),
            SchemesSection(),
            SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: openDiseaseRecognition,
        child: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
        ],
      ),
    );
  }
}
