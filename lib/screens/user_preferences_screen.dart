import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserPreferencesScreen extends StatelessWidget {
  const UserPreferencesScreen({Key? key}) : super(key: key);

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
        title: const Text('Preferences', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Travel Preferences', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const Text('Customize your commuting experience.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
            const SizedBox(height: 32),
            
            _buildPreferenceGroup('Routes', [
              _buildPreferenceItem(Icons.home, 'Saved Home Address', '123 Soweto St, Johannesburg'),
              _buildPreferenceItem(Icons.work, 'Saved Work Address', '45 Sandton Dr, Sandton'),
              _buildPreferenceItem(Icons.favorite, 'Frequent Routes', '3 routes saved'),
            ]),
            const SizedBox(height: 32),
            
            _buildPreferenceGroup('Alerts & Notifications', [
              _buildToggleItem(Icons.notifications_active, 'Ride Reminders', true),
              _buildToggleItem(Icons.emergency, 'Safety Alerts', true),
              _buildToggleItem(Icons.local_offer, 'Promotional Offers', false),
            ]),
            const SizedBox(height: 32),

            _buildPreferenceGroup('Accessibility', [
              _buildToggleItem(Icons.accessible, 'Wheelchair Accessible Only', false),
              _buildToggleItem(Icons.volume_up, 'Audio Announcements', true),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildPreferenceGroup(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Color(0xfff97316), fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xff122131),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xff273647)),
          ),
          child: Column(
            children: children.asMap().entries.map((entry) {
              return Column(
                children: [
                  entry.value,
                  if (entry.key < children.length - 1)
                    const Divider(color: Color(0xff273647), height: 1, indent: 56),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildPreferenceItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xfff97316)),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
      trailing: const Icon(Icons.chevron_right, color: Color(0xffe0c0b1)),
      onTap: () {},
    );
  }

  Widget _buildToggleItem(IconData icon, String title, bool value) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xfff97316)),
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      trailing: Switch(
        value: value,
        onChanged: (v) {},
        activeColor: const Color(0xfff97316),
      ),
    );
  }
}
