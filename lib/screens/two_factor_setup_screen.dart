import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TwoFactorSetupScreen extends StatelessWidget {
  const TwoFactorSetupScreen({Key? key}) : super(key: key);

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
        title: const Text('Security', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Icon(Icons.security, color: Color(0xfff97316), size: 64),
            const SizedBox(height: 24),
            const Text('Two-Factor Authentication', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Add an extra layer of security to your account.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14), textAlign: TextAlign.center),
            const SizedBox(height: 40),
            _buildSecurityOption(
              context,
              title: 'SMS Verification',
              subtitle: 'Receive a code via text message.',
              icon: Icons.sms,
              isEnabled: true,
            ),
            const SizedBox(height: 16),
            _buildSecurityOption(
              context,
              title: 'Authenticator App',
              subtitle: 'Use Google Authenticator or Authy.',
              icon: Icons.phonelink_setup,
              isEnabled: false,
            ),
            const SizedBox(height: 16),
            _buildSecurityOption(
              context,
              title: 'Email Code',
              subtitle: 'Verification code sent to your email.',
              icon: Icons.email,
              isEnabled: false,
            ),
            const SizedBox(height: 48),
            const Text('Trusted Devices', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildDeviceItem('iPhone 14 Pro', 'Johannesburg, South Africa', 'Active Now'),
            _buildDeviceItem('MacBook Pro 16"', 'Cape Town, South Africa', 'Last active 2 days ago'),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityOption(BuildContext context, {required String title, required String subtitle, required IconData icon, required bool isEnabled}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isEnabled ? const Color(0xfff97316).withOpacity(0.5) : const Color(0xff273647)),
      ),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xff1c2b3c), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: const Color(0xfff97316))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              ],
            ),
          ),
          Switch(value: isEnabled, onChanged: (v) {}, activeColor: const Color(0xfff97316)),
        ],
      ),
    );
  }

  Widget _buildDeviceItem(String name, String location, String status) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          const Icon(Icons.devices, color: Color(0xff94a3b8)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text('$location • $status', style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
              ],
            ),
          ),
          const Icon(Icons.more_vert, color: Color(0xff94a3b8)),
        ],
      ),
    );
  }
}
