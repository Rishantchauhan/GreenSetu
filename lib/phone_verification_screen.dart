import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'otp_verification_screen.dart';


class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Krishi Mitra"),
        backgroundColor: const Color(0xFF2E7D32),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ToggleButtons(
              borderRadius: BorderRadius.circular(10),
              isSelected: [true, false],
              children: const [Text("ENG"), Text("हिंदी")],
              onPressed: (index) {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              "Phone Number Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: phoneController, // ✅ linked controller
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                prefixText: "+91 ",
                labelText: "Enter your phone number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                  onPressed: () async {
                    final phone = phoneController.text.trim();
                    if (phone.isEmpty || phone.length != 10) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter a valid 10-digit phone number")),
                      );
                      return;
                    }

                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: "+91$phone",
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException ex) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Verification failed: ${ex.message}")),
                        );
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OTPVerificationScreen(
                              verificationId: verificationId,
                            ),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },

                  child: const Text("Send OTP", style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 40),
            const Icon(Icons.verified_user, size: 120, color: Colors.green),
            const Spacer(),
            const Text(
              "You will receive a 6-digit code via SMS",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
