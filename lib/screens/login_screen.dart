import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Ambient Background
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x1Af97316), // primary-container/10
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 250,
              height: 250,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0x4D273647), // surface-container-highest/30
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 420),
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: const Color(0xCC122131), // surface-container/80
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0x4D584237)), // outline-variant/30
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Header
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xfff97316),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x33f97316),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Icon(Icons.directions_bus, color: Color(0xff582200), size: 32),
                    ),
                    const SizedBox(height: 16),
                    Text('Login', style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 32)),
                    const SizedBox(height: 8),
                    Text('Welcome back! Please enter your details.', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[400])),
                    const SizedBox(height: 32),
                    
                    // Email/Phone Input
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email or Phone', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your email or phone number',
                            hintStyle: const TextStyle(color: Color(0xffa78b7d)),
                            prefixIcon: const Icon(Icons.mail_outline, color: Color(0xffe0c0b1)),
                            filled: true,
                            fillColor: const Color(0xff010f1f), // surface-container-lowest
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xff584237)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xff584237)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xffffb690)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    
                    // Password Input
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: const Text('Forgot Password?', style: TextStyle(color: Color(0xffffb690), fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Enter your password',
                            hintStyle: const TextStyle(color: Color(0xffa78b7d)),
                            prefixIcon: const Icon(Icons.lock_outline, color: Color(0xffe0c0b1)),
                            suffixIcon: const Icon(Icons.visibility_outlined, color: Color(0xffe0c0b1)),
                            filled: true,
                            fillColor: const Color(0xff010f1f),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xff584237)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xff584237)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0xffffb690)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Login Button
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () => context.go('/dashboard'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xfff97316),
                          foregroundColor: const Color(0xff582200),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Divider
                    Row(
                      children: [
                        const Expanded(child: Divider(color: Color(0xff584237))),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Or continue with', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                        ),
                        const Expanded(child: Divider(color: Color(0xff584237))),
                      ],
                    ),
                    const SizedBox(height: 24),
                    
                    // Social Login
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.g_mobiledata, color: Colors.white, size: 28),
                        label: const Text('Continue with Google', style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xff273647),
                          side: const BorderSide(color: Color(0xff584237)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.apple, color: Colors.white, size: 28),
                        label: const Text('Continue with Apple', style: TextStyle(color: Colors.white)),
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0xff273647),
                          side: const BorderSide(color: Color(0xff584237)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Footer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?", style: TextStyle(color: Colors.grey[400])),
                        TextButton(
                          onPressed: () => context.push('/sign-up-type'),
                          child: const Text('Sign up', style: TextStyle(color: Color(0xffffb690), fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
