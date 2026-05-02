import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpAccountTypeScreen extends StatefulWidget {
  const SignUpAccountTypeScreen({Key? key}) : super(key: key);

  @override
  State<SignUpAccountTypeScreen> createState() => _SignUpAccountTypeScreenState();
}

class _SignUpAccountTypeScreenState extends State<SignUpAccountTypeScreen> {
  String _selectedType = 'commuter';

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
        title: const Text('EBell', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 14)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              const Text(
                'Choose Account Type',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.02,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Select how you want to use EBell to get the best experience.',
                style: TextStyle(
                  color: Color(0xffe0c0b1),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Column(
                  children: [
                    _buildOption(
                      type: 'commuter',
                      icon: Icons.person,
                      title: 'Join as a Commuter',
                      description: 'Find routes, track vehicles in real-time, and pay securely from your phone.',
                    ),
                    const SizedBox(height: 16),
                    _buildOption(
                      type: 'driver',
                      icon: Icons.directions_bus,
                      title: 'Join as a Driver',
                      description: 'Manage your routes, connect with commuters, and receive payments directly.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.push('/register'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff97316),
                    foregroundColor: const Color(0xff582200),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Continue',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required String type,
    required IconData icon,
    required String title,
    required String description,
  }) {
    bool isSelected = _selectedType == type;
    return GestureDetector(
      onTap: () => setState(() => _selectedType = type),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0x1Af97316) : const Color(0xff0d1c2d),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? const Color(0xfff97316) : const Color(0xff273647),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isSelected ? const Color(0xfff97316) : const Color(0xff3e495d),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected ? const Color(0xff552100) : const Color(0xffaeb9d0),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xffe0c0b1),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xfff97316) : Colors.transparent,
                border: Border.all(
                  color: isSelected ? const Color(0xfff97316) : const Color(0xff273647),
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(Icons.check, size: 16, color: Color(0xff552100))
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
