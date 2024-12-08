import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OtpVerificationScreen extends ConsumerWidget {
  final otpControllers = List.generate(4, (index) => TextEditingController());

  OtpVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Scaling factors for responsiveness
    double fontScale = screenWidth / 375.0; // Base width is 375 for scaling
    double heightScale = screenHeight / 812.0; // Base height is 812 for scaling

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'Assets/Images/backarrow.svg',
            height: 25 * fontScale,
            width: 25 * fontScale,
          ),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Image.asset(
          'Assets/Images/CarbonCap.png',
          width: screenWidth * 0.5,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 24 * heightScale),
            Text(
              'Verification Code',
              style: TextStyle(
                fontSize: 22 * fontScale,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 8 * heightScale),
            Text(
              'We have sent the 4-digit Verification code to your\nPhone Number and Email Address',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16 * fontScale,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8 * heightScale),
            Text(
              'abc@gmail.com and 03***-***932',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16 * fontScale,
                color: Colors.green[600],
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 24 * heightScale),

            // OTP Input Fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: otpControllers.map((controller) {
                return SizedBox(
                  width: 60 * fontScale,
                  height: 60 * fontScale,
                  child: TextField(
                    controller: controller,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    style: TextStyle(
                      fontSize: 22 * fontScale,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      counterText: "",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey.shade300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: const BorderSide(color: Colors.green),
                      ),
                      contentPadding: EdgeInsets.all(8 * fontScale),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 24 * heightScale),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("OTP Resent")),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20 * fontScale,
                      vertical: 12 * heightScale,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Resend',
                    style: TextStyle(
                      fontSize: 16 * fontScale,
                      color: Colors.grey,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    final otp = otpControllers.map((e) => e.text).join();
                    if (otp.length < 4) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Enter complete OTP")),
                      );
                    } else {
                      context.go('/dashboard');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(
                      horizontal: 40 * fontScale,
                      vertical: 12 * heightScale,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Verify',
                    style: TextStyle(
                      fontSize: 16 * fontScale,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),

            SizedBox(height: 24 * heightScale),
          ],
        ),
      ),
    );
  }
}