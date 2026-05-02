import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  bool _biometricsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff010f1f), // surface-container-lowest
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xfff97316)),
          onPressed: () {},
        ),
        title: const Text('Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Color(0xfff97316)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xff122131),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff273647)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xfff97316), width: 2),
                      image: const DecorationImage(
                        image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuD3ClaIo5Cdq7Omc2MsP2txuAo9vNJzx1QXPczWYMxvyWLAuBc7LSmNRvO4OZZ4BUaAxA1bmUvXWlnIKvUecCJZqTyzq7Wf6uPoSHAupUUQkrmBxlvp36SGneMNrvv1rkADr9WEQA1X91fOd5WnzFuvkjyyvpP04kGPPOdArgs_h9LtIpGbG0mTGUbM1JxYPaxtHTaWGR0JnEmq-RI8vQCbx9HiPCR3-mI6TxHyQpA04deJi8liIuuyftWfv2yZiEpdz5vTlSOd8eI'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Thabo Mokoena', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(Icons.verified, color: Color(0xffffb690), size: 16),
                          SizedBox(width: 4),
                          Text('Verified Commuter', style: TextStyle(color: Color(0xffffb690), fontWeight: FontWeight.bold, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Account Section
            _buildSectionTitle('ACCOUNT'),
            _buildSection(
              children: [
                _buildListTile(icon: Icons.person, title: 'Personal Information'),
                const Divider(color: Color(0xff273647), height: 1),
                _buildListTile(icon: Icons.credit_card, title: 'Payment Methods'),
              ],
            ),
            const SizedBox(height: 24),

            // Security Section
            _buildSectionTitle('SECURITY'),
            _buildSection(
              children: [
                _buildListTile(icon: Icons.lock, title: 'Change Password'),
                const Divider(color: Color(0xff273647), height: 1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(color: Color(0xff273647), shape: BoxShape.circle),
                            child: const Icon(Icons.fingerprint, color: Color(0xffd4e4fa)),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Biometric Login', style: TextStyle(color: Colors.white, fontSize: 16)),
                              Text('Use FaceID or Fingerprint', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                      Switch(
                        value: _biometricsEnabled,
                        activeColor: const Color(0xff582200),
                        activeTrackColor: const Color(0xfff97316),
                        onChanged: (val) {
                          setState(() {
                            _biometricsEnabled = val;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Safety Section
            _buildSectionTitle('SAFETY'),
            _buildSection(
              children: [
                _buildListTile(icon: Icons.contact_emergency, title: 'Emergency Contacts'),
                const Divider(color: Color(0xff273647), height: 1),
                _buildListTile(icon: Icons.shield, title: 'Safety Center'),
                const Divider(color: Color(0xff273647), height: 1),
                _buildListTile(icon: Icons.group, title: 'Trusted Contacts'),
              ],
            ),
            const SizedBox(height: 24),

            // Preferences Section
            _buildSectionTitle('PREFERENCES'),
            _buildSection(
              children: [
                _buildListTile(icon: Icons.notifications_active, title: 'Notifications'),
                const Divider(color: Color(0xff273647), height: 1),
                _buildListTile(icon: Icons.language, title: 'Language', trailingText: 'English'),
              ],
            ),
            const SizedBox(height: 32),

            // Logout Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.logout, color: Colors.redAccent),
                label: const Text('Logout', style: TextStyle(color: Colors.redAccent, fontSize: 16, fontWeight: FontWeight.bold)),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff0b1120),
          border: Border(top: BorderSide(color: Color(0xff1e293b))),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.map, label: 'Map'),
                _buildNavItem(icon: Icons.dock, label: 'Activity'),
                _buildNavItem(icon: Icons.payments, label: 'Wallet'),
                _buildNavItem(icon: Icons.person, label: 'Profile', isSelected: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2),
      ),
    );
  }

  Widget _buildSection({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildListTile({required IconData icon, required String title, String? trailingText}) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(color: Color(0xff273647), shape: BoxShape.circle),
                  child: Icon(icon, color: const Color(0xffd4e4fa)),
                ),
                const SizedBox(width: 12),
                Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
              ],
            ),
            Row(
              children: [
                if (trailingText != null) ...[
                  Text(trailingText, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
                  const SizedBox(width: 8),
                ],
                const Icon(Icons.chevron_right, color: Color(0xffe0c0b1)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, bool isSelected = false}) {
    return Container(
      width: 64,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: isSelected
          ? BoxDecoration(
              color: const Color(0x1Af97316),
              borderRadius: BorderRadius.circular(12),
            )
          : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xfff97316) : const Color(0xff94a3b8),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xfff97316) : const Color(0xff94a3b8),
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
