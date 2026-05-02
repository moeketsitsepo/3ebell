import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SafetyCenterScreen extends StatelessWidget {
  const SafetyCenterScreen({Key? key}) : super(key: key);

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
        title: const Text('Safety Center', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.emergency, color: Color(0xfff97316)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Emergency Assistance
            const Text('Emergency Assistance', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildSOSButton(context),
            const SizedBox(height: 32),
            
            // Safety Resources
            const Text('Safety Resources', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildSafetyResourceItem(Icons.tips_and_updates, 'Safety Tips', 'Best practices for commuting safely.'),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(child: _buildSmallResourceItem(Icons.report, 'Incident Reporting', 'Report a past issue.')),
                const SizedBox(width: 12),
                Expanded(child: _buildSmallResourceItem(Icons.gavel, 'Community Guidelines', 'Rules for all users.')),
              ],
            ),
            const SizedBox(height: 32),

            // Support
            const Text('Support', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildSupportMenu(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildSOSButton(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/safety/sos-active'),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: const Color(0xff93000a),
          borderRadius: BorderRadius.circular(16),
          image: const DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1557672172-298e090bd0f1?auto=format&fit=crop&w=800&q=80'),
            fit: BoxFit.cover,
            opacity: 0.2,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Color(0xff690005), shape: BoxShape.circle),
              child: const Icon(Icons.sos, color: Colors.white, size: 48),
            ),
            const SizedBox(height: 16),
            const Text('SOS Emergency', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const Text(
              'Slide or tap to alert authorities and designated contacts immediately.',
              style: TextStyle(color: Colors.white70, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSafetyResourceItem(IconData icon, String title, String subtitle, {VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff122131),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xff584237)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xfff97316).withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
              child: Icon(icon, color: const Color(0xfff97316)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Color(0xffe0c0b1)),
          ],
        ),
      ),
    );
  }

  Widget _buildSmallResourceItem(IconData icon, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: const Color(0xfff97316).withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Icon(icon, color: const Color(0xfff97316)),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildSupportMenu(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Column(
        children: [
          _buildSupportMenuItem(Icons.report, 'Report an Incident', onTap: () => context.push('/support/report')),
          const Divider(color: Color(0xff584237), height: 1),
          _buildSupportMenuItem(Icons.support_agent, 'Contact Safety Team', onTap: () => context.push('/support/chat')),
          const Divider(color: Color(0xff584237), height: 1),
          _buildSupportMenuItem(Icons.help, 'FAQ', onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildSupportMenuItem(IconData icon, String label, {required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xfff97316)),
      title: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      trailing: const Icon(Icons.chevron_right, color: Color(0xffe0c0b1)),
      onTap: onTap,
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xff0b1120),
        border: Border(top: BorderSide(color: Color(0xff1e293b))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.map, 'Map'),
          _buildNavItem(Icons.commute, 'Trips'),
          _buildNavItem(Icons.shield, 'Safety', isSelected: true),
          _buildNavItem(Icons.history, 'Activity'),
          _buildNavItem(Icons.person, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), fontSize: 10)),
      ],
    );
  }
}
