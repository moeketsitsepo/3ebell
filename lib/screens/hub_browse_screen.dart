import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class HubBrowseScreen extends StatelessWidget {
  const HubBrowseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.deepOrange),
          onPressed: () {},
        ),
        title: const Text('EBell', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w900)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xff1e293b)),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAyt66h1z-QwevFifAzqNRDANaFaKwryttErRb_TcrsEFXpb30CYwCIRsN2R6FaOMnQn-_EXjQrZ0CWuY-AuF0y-jpXF9fZeQ0qcSTPJI-Acp3zC7ObmXlcFtqz6Tvkgu3u3eAUjY09ScInnXCSXb3ge7sMu2S9ZQaYTZKdR1sDqeibNvRfKdnunROukLRY6hspEF5uONcWlC04Nt_WJVRWaTaDqWvEdq7YcbdIEhMiUdwk9h7pk8m4dPJPYdQwUan9wv5Ffe2z3Ws'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Browse', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                TextButton.icon(
                  onPressed: () => context.push('/hub/compare'),
                  icon: const Icon(Icons.compare_arrows, color: Color(0xfff97316)),
                  label: const Text('Compare', style: TextStyle(color: Color(0xfff97316))),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Bento Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                // Hikes (spans 2 columns, but GridView.count doesn't support colSpan easily, so we use a Column with custom sizing)
              ],
            ),
            
            // Re-implementing with custom column/row layout for colSpan support
            _buildHikesCard(),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildAskFriendCard()),
                const SizedBox(width: 16),
                Expanded(child: _buildCommutersCard()),
              ],
            ),
            const SizedBox(height: 16),
            _buildPreferencesCard(context),
            
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff0f172a), 
          border: Border(top: BorderSide(color: Color(0xff1e293b))),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.grid_view, label: 'Hub', isSelected: true),
                _buildNavItem(icon: Icons.explore, label: 'Live Map'),
                _buildNavItem(icon: Icons.stars, label: 'Plan'),
                _buildNavItem(icon: Icons.admin_panel_settings, label: 'Admin'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHikesCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffe0e7ff), Color(0xffc7d2fe)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0x80e0e7ff),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Hikes', style: TextStyle(color: Color(0xff312e81), fontWeight: FontWeight.bold, fontSize: 14)),
                ),
                const SizedBox(height: 8),
                const Text('Find or offer a hike to your destination.', style: TextStyle(color: Color(0xff1e1b4b), fontWeight: FontWeight.w500, fontSize: 16)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Color(0x66ffffff),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.directions_walk, color: Color(0xff4f46e5), size: 36),
          ),
        ],
      ),
    );
  }

  Widget _buildAskFriendCard() {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xfffce7f3), Color(0xfffbcfe8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0x80fce7f3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Ask a Friend', style: TextStyle(color: Color(0xff831843), fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Flexible(child: Text('Request a ride.', style: TextStyle(color: Color(0xff4c0519), fontWeight: FontWeight.w500, fontSize: 14))),
              const Icon(Icons.how_to_reg, color: Color(0xffdb2777), size: 32),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommutersCard() {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xffdcfce7), Color(0xffbbf7d0)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0x80dcfce7),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text('Commuters', style: TextStyle(color: Color(0xff14532d), fontWeight: FontWeight.bold, fontSize: 12)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Flexible(child: Text('Connect.', style: TextStyle(color: Color(0xff052e16), fontWeight: FontWeight.w500, fontSize: 14))),
              const Icon(Icons.group, color: Color(0xff16a34a), size: 32),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPreferencesCard(BuildContext context) {
    return InkWell(
      onTap: () => context.push('/preferences'),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xfffef3c7), Color(0xfffde68a)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4))],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                color: Color(0x80fef3c7),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.settings, color: Color(0xffd97706), size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Preferences', style: TextStyle(color: Color(0xff78350f), fontWeight: FontWeight.bold, fontSize: 14)),
                  const Text('Manage your routes and alerts.', style: TextStyle(color: Color(0xff451a03), fontWeight: FontWeight.w500, fontSize: 14)),
                ],
              ),
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
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
