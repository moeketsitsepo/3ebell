import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DriverOnboardingScreen extends StatelessWidget {
  const DriverOnboardingScreen({Key? key}) : super(key: key);

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
        title: const Text('Driver Onboarding', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProgressStepper(),
            const SizedBox(height: 32),
            const Text('Upload Documents', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('We need to verify your identity and vehicle documents.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
            const SizedBox(height: 32),
            _buildUploadCard(
              title: 'Professional Driver\'s Permit (PrDP)',
              subtitle: 'Valid South African driver\'s license with PrDP.',
              status: 'Uploaded',
              icon: Icons.badge,
              isCompleted: true,
            ),
            const SizedBox(height: 16),
            _buildUploadCard(
              title: 'Vehicle Registration',
              subtitle: 'Official eNaTIS registration document.',
              status: 'Pending',
              icon: Icons.description,
            ),
            const SizedBox(height: 16),
            _buildUploadCard(
              title: 'Insurance Policy',
              subtitle: 'Comprehensive passenger liability insurance.',
              status: 'Required',
              icon: Icons.security,
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.go('/driver/dashboard'),
                child: const Text('Submit for Verification', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff97316),
                  foregroundColor: const Color(0xff582200),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressStepper() {
    return Row(
      children: [
        _buildStep(1, 'Profile', true),
        _buildStepDivider(true),
        _buildStep(2, 'Documents', true, isActive: true),
        _buildStepDivider(false),
        _buildStep(3, 'Verify', false),
      ],
    );
  }

  Widget _buildStep(int number, String label, bool isDone, {bool isActive = false}) {
    return Column(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(
            color: isDone ? const Color(0xfff97316) : const Color(0xff122131),
            shape: BoxShape.circle,
            border: Border.all(color: isActive ? const Color(0xfff97316) : const Color(0xff273647), width: 2),
          ),
          child: Center(
            child: isDone && !isActive
                ? const Icon(Icons.check, color: Color(0xff582200), size: 18)
                : Text(number.toString(), style: TextStyle(color: isDone ? const Color(0xff582200) : const Color(0xffe0c0b1), fontWeight: FontWeight.bold)),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: TextStyle(color: isDone || isActive ? Colors.white : const Color(0xffe0c0b1), fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildStepDivider(bool isDone) {
    return Expanded(
      child: Container(
        height: 2,
        margin: const EdgeInsets.only(bottom: 20),
        color: isDone ? const Color(0xfff97316) : const Color(0xff273647),
      ),
    );
  }

  Widget _buildUploadCard({required String title, required String subtitle, required String status, required IconData icon, bool isCompleted = false}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isCompleted ? Colors.green.withOpacity(0.3) : const Color(0xff273647)),
      ),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xff051424), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: const Color(0xfff97316))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(status, style: TextStyle(color: isCompleted ? Colors.green : const Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 10)),
              const SizedBox(height: 8),
              Icon(isCompleted ? Icons.check_circle : Icons.upload_file, color: isCompleted ? Colors.green : const Color(0xff94a3b8), size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
