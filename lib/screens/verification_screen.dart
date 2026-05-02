import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xfff97316)),
          onPressed: () => context.pop(),
        ),
        title: const Text('EBell', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.w900, letterSpacing: -1)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 48),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: const Color(0xff1c2b3c),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xff273647)),
                ),
                child: const Icon(
                  Icons.sms_rounded,
                  color: Color(0xfff97316),
                  size: 32,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Check your phone',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "We've sent a 6-digit verification code to ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16),
              ),
              const Text(
                '+27 82 *** **14',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) => _buildOTPBox(index == 2)),
              ),
              const SizedBox(height: 32),
              const Text(
                "Didn't receive the code? ",
                style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Resend Code',
                  style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold),
                ),
              ),
              const Text(
                'Request new code in 00:45',
                style: TextStyle(color: Color(0xff273647), fontSize: 12),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton(
                  onPressed: () => context.go('/dashboard'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff97316),
                    foregroundColor: const Color(0xff582200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Verify',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.check_circle, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOTPBox(bool isFocused) {
    return Container(
      width: 48,
      height: 56,
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isFocused ? const Color(0xfff97316) : const Color(0xff273647),
          width: isFocused ? 2 : 1,
        ),
        boxShadow: isFocused
            ? [BoxShadow(color: const Color(0xfff97316).withOpacity(0.15), blurRadius: 15)]
            : null,
      ),
      child: Center(
        child: isFocused
            ? Container(
                width: 2,
                height: 24,
                color: const Color(0xfff97316),
              )
            : const Text(
                '', // Placeholder for actual input logic
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
