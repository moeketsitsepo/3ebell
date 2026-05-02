import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 900;

    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: Row(
        children: [
          if (isDesktop) _buildSidebar(context),
          Expanded(
            child: Column(
              children: [
                _buildHeader(context, isDesktop),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('System Settings', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        const Text('Configure platform-wide parameters and safety thresholds.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
                        const SizedBox(height: 32),
                        _buildSettingsSection('Transport & Fees', [
                          _buildSettingToggle('Dynamic Pricing', 'Adjust fares based on demand and traffic.', true),
                          _buildSettingInput('Base Platform Fee (%)', '5.0'),
                          _buildSettingInput('Minibus Base Fare (R)', '15.00'),
                        ]),
                        const SizedBox(height: 32),
                        _buildSettingsSection('Safety & Security', [
                          _buildSettingToggle('Auto-Trigger SOS', 'Automatically alert authorities after 2 mins of inactivity.', false),
                          _buildSettingInput('Speeding Threshold (km/h)', '120'),
                          _buildSettingToggle('Driver Face Verification', 'Require periodic selfie checks during shifts.', true),
                        ]),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: 200,
                          height: 48,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text('Save Changes', style: TextStyle(fontWeight: FontWeight.bold)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xfff97316),
                              foregroundColor: const Color(0xff582200),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 260,
      color: const Color(0xff0b1120),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: const Color(0xfff97316).withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                  child: const Icon(Icons.local_taxi, color: Color(0xfff97316), size: 24),
                ),
                const SizedBox(width: 12),
                const Text('EBell Admin', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.w900, fontSize: 20)),
              ],
            ),
          ),
          _buildSidebarItem(Icons.dashboard, 'Dashboard', onTap: () => context.go('/admin-overview')),
          _buildSidebarItem(Icons.group, 'Users', onTap: () => context.push('/admin/users')),
          _buildSidebarItem(Icons.verified_user, 'Verifications', onTap: () => context.push('/admin/verifications')),
          _buildSidebarItem(Icons.assessment, 'Reports', onTap: () {}),
          _buildSidebarItem(Icons.settings, 'Settings', isSelected: true, onTap: () {}),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(IconData icon, String label, {bool isSelected = false, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b)),
      title: Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      onTap: onTap,
      selected: isSelected,
      selectedTileColor: const Color(0xff111827),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDesktop) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(color: Color(0xff0b1120), border: Border(bottom: BorderSide(color: Color(0xff1e293b)))),
      child: Row(
        children: [
          if (!isDesktop) IconButton(icon: const Icon(Icons.menu, color: Color(0xfff97316)), onPressed: () {}),
          const Expanded(child: SizedBox()),
          IconButton(icon: const Icon(Icons.notifications, color: Color(0xff94a3b8)), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDisBOx_oiQIjHNo2Gp95A3wvhLdsrAtbFMBfqM0qa7QFwxsU-MRD_r74vB8_m75y4SEidx8QW97Lx1En2A8KKu6CqAz3Fo_es9_9LHhjljw9hNrsYysScJbMg5PknzXnMXlITzbVTpAllcb-457bCdShjKD_rJi9bnoxMjf8II6Ff_XZenCZsWI-yIGEskSQHrnsx6KsJ5T1QZdBedC-UJR2MKQbCE6RdjMFdZ1slnfk5NxzeDtdNBBW1s8dda_5s9UJW3he-FgQA')),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Color(0xfff97316), fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
          child: Column(
            children: children.asMap().entries.map((entry) {
              return Column(
                children: [
                  entry.value,
                  if (entry.key < children.length - 1)
                    const Divider(color: Color(0xff273647), height: 32),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildSettingToggle(String title, String subtitle, bool value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
            ],
          ),
        ),
        Switch(value: value, onChanged: (v) {}, activeColor: const Color(0xfff97316)),
      ],
    );
  }

  Widget _buildSettingInput(String title, String initialValue) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        SizedBox(
          width: 80,
          child: TextField(
            controller: TextEditingController(text: initialValue),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xff051424),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            style: const TextStyle(color: Colors.white, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
