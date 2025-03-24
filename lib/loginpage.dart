import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main background is black
      backgroundColor: Colors.black,

      // Top bar (AppBar-like) with a custom height
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          padding: EdgeInsets.all(5),
          color: const Color(0xFF04CF73),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo container on the left
                  Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'CT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  // Profile-like icon on the right

                ],
              ),
            ),
          ),
        ),
      ),

      // Use a scroll view in case the screen is small
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Transform.translate(
            offset: const Offset(0, 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Sign In" text (foreground)
            const Text(
              'Sign In',
              style: TextStyle(
                color: Color(0xFF04CF73),
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            // A small gap
            const SizedBox(height: 6),

            // "Sign Up" text (background or secondary)
            // You can adjust color/opacity to your liking
            Text(
              'Sign Up',
              style: TextStyle(
                color: Colors.white.withOpacity(0.3), // Faded effect
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),

            // Email Label
            const Text(
              'Email :',
              style: TextStyle(
                color: Color(0xFF04CF73),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Email TextField
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFDCDCDC),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 50),


            // Password Label
            const Text(
              'Password :',
              style: TextStyle(
                color: Color(0xFF04CF73),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Password TextField
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFDCDCDC),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                obscureText: true,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: const Color(0xFF04CF73),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Sign In Button
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF04CF73),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),

                onPressed: () {
                  // TODO: Handle Sign In action
                },

                child: Container(
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),),

              ),
            ),
            const SizedBox(height: 20),

            // "or" divider
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white.withOpacity(0.6),
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white.withOpacity(0.6),
                    thickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // "Don't have an account? Sign Up"
            Center(
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account? ",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                  children: [
                    TextSpan(
                      text: 'Sign Up',
                      style: const TextStyle(
                        color: Color(0xFF04CF73),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      // You could add a recognizer here for a tap event
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Privacy Policy
            Center(
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: const Color(0xFF04CF73),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    ),),);
  }
}
