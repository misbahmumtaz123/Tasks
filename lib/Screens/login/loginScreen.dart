import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    double fontScale = screenWidth / 375.0;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Top-right design
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: Image.asset(
                          'Assets/Images/Topright.png',
                          width: screenWidth * 0.53,
                          height: screenHeight * 0.22,
                        ),
                      ),
                    ],
                  ),

                  // Welcome Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to',
                          style: TextStyle(
                            fontSize: 24 * fontScale,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Carbon',
                                style: TextStyle(
                                  fontSize: 24, // Fixed size for this part
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff2E7758),
                                ),
                              ),
                              TextSpan(
                                text: 'Cap',
                                style: TextStyle(
                                  fontSize: 24, // Fixed size for this part
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff52BF90),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Please Sign in or Sign up in CarbonCap',
                          style: TextStyle(
                            fontSize: 16 * fontScale,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Input Fields Section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      children: [
                        SizedBox(height: screenHeight * 0.02),
                        Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 20 * fontScale,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Email',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter Your Password',
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: const Icon(Icons.visibility),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Remember Password',
                                  style: TextStyle(fontSize: 14 * fontScale),
                                ),
                                Checkbox(value: false, onChanged: (value) {}),
                              ],
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget Password',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14 * fontScale,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(

                              onPressed: () => context.go('/dashboard'),

                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff52BF90),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                            ),
                            child: Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 16 * fontScale,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Section
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New in CarbonCap? ',
                              style: TextStyle(fontSize: 14 * fontScale),
                            ),
                            TextButton(
                              onPressed: () {
                                context.go('/signup');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 14 * fontScale,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing: screenWidth * 0.04,
                          runSpacing: screenWidth * 0.04,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: SvgPicture.asset(
                                        'Assets/Images/share.svg',
                                        height: screenWidth * 0.08,
                                        width: screenWidth * 0.08,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Text(
                                      'Share',
                                      style: TextStyle(
                                        fontSize: 12 * fontScale,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'Assets/Images/facebook.svg',
                                    height: screenWidth * 0.12,
                                    width: screenWidth * 0.12,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'Assets/Images/linkedin.svg',
                                    height: screenWidth * 0.12,
                                    width: screenWidth * 0.12,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'Assets/Images/whatsapp.svg',
                                    height: screenWidth * 0.12,
                                    width: screenWidth * 0.12,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: SvgPicture.asset(
                                    'Assets/Images/insta.svg',
                                    height: screenWidth * 0.12,
                                    width: screenWidth * 0.12,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
