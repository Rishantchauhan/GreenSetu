import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'phone_verification_screen.dart'; // ✅ Import here

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhoneVerificationScreen(), // ✅ Start with phone verification
  ));
}
