import 'package:evalueationtask/Screens/SignUp/SignupProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({Key? key}) : super(key: key);

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final genderController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signupState = ref.watch(signupViewModelProvider);
    final signupViewModel = ref.read(signupViewModelProvider.notifier);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'Assets/Images/backarrow.svg',
            height: 25,
            width: 25,
          ),
          onPressed: () => context.pop(),
        ),
        centerTitle: true,
        title: Image.asset(
          'Assets/Images/CarbonCap.png',
          width: screenWidth * 0.53,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 16),
            buildTextField(
              controller: firstNameController,
              hintText: 'First Name*',
              errorText: signupState.firstNameError,
            ),
            const SizedBox(height: 12),
            buildTextField(
              controller: lastNameController,
              hintText: 'Last Name*',
              errorText: signupState.lastNameError,
            ),
            const SizedBox(height: 12),
            buildTextField(
              controller: emailController,
              hintText: 'Email*',
              errorText: signupState.emailError,
            ),
            const SizedBox(height: 12),
            buildTextField(
              controller: phoneController,
              hintText: 'Phone Number*',
              errorText: signupState.phoneError,
            ),
            const SizedBox(height: 12),
            buildTextField(
              controller: addressController,
              hintText: 'Address*',
              errorText: signupState.addressError,
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                hintText: 'Gender*',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
              items: ['Male', 'Female', 'Other']
                  .map((gender) => DropdownMenuItem(
                value: gender,
                child: Text(gender),
              ))
                  .toList(),
              onChanged: (value) {
                genderController.text = value ?? '';
              },
            ),
            const SizedBox(height: 12),
            buildTextField(
              controller: passwordController,
              hintText: 'Password*',
              errorText: signupState.passwordError,
              obscureText: true,
            ),
            const SizedBox(height: 12),
            buildTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Password*',
              errorText: signupState.confirmPasswordError,
              obscureText: true,
            ),
            const SizedBox(height: 12),
            Center( // Center the button horizontally
              child: SizedBox(
                width: screenWidth * 0.7,
                child: ElevatedButton(
                  onPressed: signupState.isLoading
                      ? null
                      : () async {
                    final isValid = signupViewModel.validateAndSubmit(
                      firstNameController.text,
                      lastNameController.text,
                      emailController.text,
                      phoneController.text,
                      addressController.text,
                      genderController.text,
                      passwordController.text,
                      confirmPasswordController.text,
                    );

                    if (isValid) {
                      final success = await signupViewModel.signup();
                      if (success) {
                        // Navigate to OTP verification screen
                        context.go(
                          '/otp',
                          extra: {'email': emailController.text},
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                            Text('Signup failed. Please try again!'),
                          ),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff52BF90),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: signupState.isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                    'Next',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  TextButton(
                    onPressed: () => context.go('/'),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hintText,
    String? errorText,
    bool obscureText = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              errorText,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
