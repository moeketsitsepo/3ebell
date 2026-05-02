import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpRegistrationScreen extends StatelessWidget {
  const SignUpRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('EBell', style: TextStyle(color: Color(0xfff97316), fontSize: 48, fontWeight: FontWeight.w900, letterSpacing: -2)),
                const SizedBox(height: 8),
                const Text('Create your account to start your journey.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16), textAlign: TextAlign.center),
                const SizedBox(height: 40),
                _buildRegistrationForm(context),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? ', style: TextStyle(color: Color(0xffe0c0b1))),
                    GestureDetector(
                      onTap: () => context.go('/login'),
                      child: const Text('Log in', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
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

  Widget _buildRegistrationForm(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField(label: 'Full Name', hint: 'e.g. John Doe', icon: Icons.person),
          const SizedBox(height: 16),
          _buildTextField(label: 'Email Address', hint: 'name@example.com', icon: Icons.email),
          const SizedBox(height: 16),
          _buildTextField(label: 'Phone Number', hint: '+27 00 000 0000', icon: Icons.phone),
          const SizedBox(height: 16),
          _buildTextField(label: 'Password', hint: '••••••••', icon: Icons.lock, isPassword: true),
          const SizedBox(height: 8),
          const Text('Must be at least 8 characters long.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () => context.go('/dashboard'),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Create Account', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, size: 18),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfff97316),
                foregroundColor: const Color(0xff582200),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({required String label, required String hint, required IconData icon, bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: const Color(0xffe0c0b1), size: 20),
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xff273647)),
            filled: true,
            fillColor: const Color(0xff051424),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            suffixIcon: isPassword ? const Icon(Icons.visibility_off, color: Color(0xffe0c0b1), size: 20) : null,
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
