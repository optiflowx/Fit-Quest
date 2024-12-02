import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static const routeName = '/signup-screen'; // Route name for navigation

  const SignUp({Key? key}) : super(key: key);

  @override
  SignUpState createState() => SignUpState(); // Correct state class name
}

class SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2A2D34), // Background color
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Greeting text
                const Text(
                  'Hey there,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Create an Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                // Full Name Input Field
                _buildTextField(
                  icon: Icons.person_outline,
                  hintText: 'Full Name',
                ),
                const SizedBox(height: 15),
                // Phone Number Input Field
                _buildTextField(
                  icon: Icons.phone_outlined,
                  hintText: 'Phone Number',
                ),
                const SizedBox(height: 15),
                // Email Input Field
                _buildTextField(
                  icon: Icons.email_outlined,
                  hintText: 'Email',
                ),
                const SizedBox(height: 15),
                // Password Input Field
                _buildTextField(
                  icon: Icons.lock_outline,
                  hintText: 'Password',
                  isPassword: true,
                ),
                const SizedBox(height: 15),
                // Confirm Password Input Field
                _buildTextField(
                  icon: Icons.lock_outline,
                  hintText: 'Confirm Password',
                  isPassword: true,
                ),
                const SizedBox(height: 30),
                // Sign Up Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF6367F1), // Button color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Sign Up With Text
                const Text(
                  '-Or sign up with-',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                // Social Media Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Card(
                      color:
                          Color(0xFF91A5A7), // Set the card's background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0), // Optional: rounded corners
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(
                            8.0), // Padding inside the card
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Google.png',
                            height: 24,
                            width: 24,
                          ),
                          iconSize: 24,
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF91A5A7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Apple.png',
                            height: 24,
                            width: 24,
                          ),
                          iconSize: 24,
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF91A5A7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/GitHub.png',
                            height: 24,
                            width: 24,
                          ),
                          iconSize: 24,
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF91A5A7),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/Facebook.png',
                            height: 24,
                            width: 24,
                          ),
                          iconSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Already Have an Account? Login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Color(0xFF6367F1),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Input Field Builder
  Widget _buildTextField({
    required IconData icon,
    required String hintText,
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFF91A5A7), // Input field background color
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(
          icon,
          color: Colors.white, // Icon color
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white), // Input text color
    );
  }

  // Social Media Icon Builder
  Widget _buildSocialIcon(String assetPath) {
    return Card(
      color: const Color(0xFF91A5A7), // Card background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          assetPath,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}
