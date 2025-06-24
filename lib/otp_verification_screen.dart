import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:greensetu/greensetu_home.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String verificationId;
  const OTPVerificationScreen({super.key, required this.verificationId});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}


class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  String _verificationId = "";
  bool _otpSent = false;

  Future<void> _sendOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: "+91${_phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-resolved
        await FirebaseAuth.instance.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login successful!")));
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed: ${e.message}")));
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _otpSent = true;
          _verificationId = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
    );
  }

  Future<void> _verifyOTP() async {
    final credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId, // ✅ from constructor
      smsCode: _otpController.text,
    );

    try {
      await FirebaseAuth.instance.signInWithCredential(credential);

      // ✅ Navigate to home after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GreenSetuHome()), // ⬅️ Make sure you import it
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid OTP: ${e.toString()}")),
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Verification"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            if (!_otpSent) ...[
              TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Enter phone number",
                  prefixText: "+91 ",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _sendOTP,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("Send OTP"),
              ),
            ] else ...[
              TextField(
                controller: _otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter OTP",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _verifyOTP,
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("Verify OTP"),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
