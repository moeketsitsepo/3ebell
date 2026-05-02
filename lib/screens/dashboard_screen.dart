import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EBell', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w900)),
        backgroundColor: const Color(0xff020617), // slate-950
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.grey),
            onPressed: () => context.push('/notifications'),
          ),
          IconButton(
            icon: const Icon(Icons.account_circle_outlined, color: Colors.grey),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Section
            Row(
              children: [
                Text('Welcome back, Tsepo!', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24)),
                const SizedBox(width: 8),
                const Icon(Icons.check_circle, color: Colors.green, size: 24),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildQuickAction(context, Icons.route, 'Plan Route', '/plan/route'),
                const SizedBox(width: 12),
                _buildQuickAction(context, Icons.stars, 'Rewards', '/rewards'),
                const SizedBox(width: 12),
                _buildQuickAction(context, Icons.explore, 'Live Map', '/map'),
                const SizedBox(width: 12),
                _buildQuickAction(context, Icons.forum, 'Social', '/social-hub'),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildQuickAction(context, Icons.tune, 'Customize', '/trip/customize'),
                const SizedBox(width: 12),
                _buildQuickAction(context, Icons.bar_chart, 'Insights', '/commuter/insights'),
                const SizedBox(width: 12),
                const Expanded(child: SizedBox()),
                const SizedBox(width: 12),
                const Expanded(child: SizedBox()),
              ],
            ),
            const SizedBox(height: 32),

            // Account Overview Cards
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff1c2b3c), // surface-container-high
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xff273647)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ACCOUNT TYPE', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                        Text('Commuter', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: const Color(0xfff97316), fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xff1c2b3c),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xff273647)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('STATUS', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                        Row(
                          children: [
                            Text('Verified', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 4),
                            const Icon(Icons.verified, color: Colors.green, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Action Buttons Grid
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildActionCard(context, icon: Icons.directions_car, title: 'Driver Dashboard', onTap: () => context.go('/driver-dashboard')),
                _buildActionCard(context, icon: Icons.add_to_photos, title: 'Register Vehicle', onTap: () => context.push('/driver/add-vehicle')),
                _buildActionCard(context, icon: Icons.admin_panel_settings, title: 'Admin Console', onTap: () => context.go('/admin-overview')),
                _buildActionCard(context, icon: Icons.shield, title: 'Safety Center', onTap: () => context.push('/safety')),
                _buildActionCard(context, icon: Icons.stars, title: 'Refer & Earn', onTap: () => context.push('/points')),
                _buildActionCard(context, icon: Icons.group, title: 'Trusted Friends', onTap: () => context.push('/friends')),
                _buildActionCard(context, icon: Icons.commute, title: 'Browse Transport Hub', onTap: () => context.go('/hub')),
                _buildActionCard(context, icon: Icons.history, title: 'My Rides', onTap: () => context.go('/my-rides')),
                _buildActionCard(context, icon: Icons.account_balance_wallet, title: 'Wallet', onTap: () => context.go('/wallet')),
                _buildActionCard(context, icon: Icons.map, title: 'Live Map', isPrimary: true, onTap: () => context.go('/live-map')),
              ],
            ),
            const SizedBox(height: 24),

            // Image Reference Area
            Container(
              height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff273647)),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAFc7JK4uku9fHSLy90XhAny5rwZDYGD75LC4PQMyvXWlQF-xi4zIRAC7mi7elk9c--nqbGGmvwKwWv0qLY6G_bO1pQ1pi45AALJ7ldzBpVdn2IuFeo9YD5AETnsYGTMYFVR5DWLHSOKfMO8NrCLfHAv7oq9FdR2O1MxgftmqCrTHARQv_7w8c1AbbT4FKNnUuvrdzMdvmvjY5cehzVlRLSUWt5L0_8gh3pHl3P7r-Qv-t0X6VxXYBKskYJdpTHHfDA8tA6j0gqShU'),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xff010f1f), Colors.transparent],
                  ),
                ),
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.all(16),
                child: const Text('Stay connected on your journey.', style: TextStyle(color: Color(0xffe0c0b1))),
              ),
            ),
            const SizedBox(height: 80), // Space for bottom nav
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff020617), // slate-950
          border: Border(top: BorderSide(color: Color(0xff1e293b))), // slate-800
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.map, label: 'MAP', onTap: () => context.go('/live-map')),
                _buildNavItem(icon: Icons.groups, label: 'HUB', onTap: () => context.go('/hub')),
                _buildNavItem(icon: Icons.dashboard, label: 'DASHBOARD', isSelected: true),
                _buildNavItem(icon: Icons.person, label: 'PROFILE', onTap: () => context.go('/profile')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(BuildContext context, {required IconData icon, required String title, bool isPrimary = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff122131), // surface-container
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff273647)), // surface-variant
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: isPrimary ? const Color(0xfff97316) : const Color(0xff3e495d), // primary-container or secondary-container
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: isPrimary ? const Color(0xff582200) : const Color(0xffaeb9d0)),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isPrimary ? const Color(0xfff97316) : const Color(0xffd4e4fa),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget _buildNavItem({required IconData icon, required String label, bool isSelected = false, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: isSelected
                ? BoxDecoration(
                    color: const Color(0x1Af97316), // orange-500/10
                    borderRadius: BorderRadius.circular(12),
                  )
                : null,
            child: Icon(
              icon,
              color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), // orange-500 or slate-500
              size: 28,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickAction(BuildContext context, IconData icon, String label, String route) {
    return Expanded(
      child: InkWell(
        onTap: () => context.push(route),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xff122131),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xff273647)),
          ),
          child: Column(
            children: [
              Icon(icon, color: const Color(0xfff97316), size: 24),
              const SizedBox(height: 8),
              Text(label, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
