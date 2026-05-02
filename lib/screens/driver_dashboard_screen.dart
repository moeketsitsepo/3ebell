import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff010f1f), // surface-container-lowest
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xfff97316)),
          onPressed: () {},
        ),
        title: const Text('EBell Driver', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 24)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xff94a3b8)),
            onPressed: () => context.push('/notifications'),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: const NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBPGghgrSohC6T6ZFGKccAfZ_hX042cyVAfuAkzaeXAxX5DcUvHG24CdmmhNm-Xu0276JKJy-Lmg_SV-KThr7K8TIkziGT-wclYSKy-FRKW2geMevkv6EZUXZeEtp7v_ccLim6aMI8QkXqqph4o01_ox8fD5FeSrO-eBQkNNV-psIJSRPpII7ErzLYW6I_NNdBNMdbk8amNdrFl1217BYlflvjVB7QuCpf5eGsHbbQ6ak3hgU-5H0aiMC5mG7voHvOY4GDSZYsG2Mg'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xfff97316).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xfff97316).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error_outline, color: Color(0xfff97316)),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text('Complete your profile to start accepting trips.', style: TextStyle(color: Colors.white, fontSize: 13)),
                  ),
                  TextButton(
                    onPressed: () => context.push('/driver/onboarding'),
                    child: const Text('Complete Now', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 13)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Go Online Action Area
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xff122131),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff584237)), // outline-variant
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDN7s1WZDAMMge9KVfgL6yb8OkQdDqzZOIEhlfwvErxh1Ekr6y18umq_g2p7IuASNTDYDvlaZi6ZpJayE3Z-QufozNCdtCZCHLLRjfc4hu1QhxvA1ucndH5pgswK4kEk8e9xEWpfK3nRQauXVHgkplEIhaV9ZjvtmTitogClEktuYaMbOltcclRYvRwjKjCa5UQyVaVlDeBEfWi6ej7mDVKReJClZHw0m5V4vauO_jiavfyIJ-bowI83Dzr-lTF20s_I7zKMejepO8'),
                  fit: BoxFit.cover,
                  opacity: 0.15,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xff273647), // surface-variant
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xff584237)),
                    ),
                    child: InkWell(
                      onTap: () => context.push('/driver/shift-summary'),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xff929ab2), shape: BoxShape.circle)), // tertiary-container
                          const SizedBox(width: 8),
                          const Text('CURRENTLY OFFLINE', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                          const SizedBox(width: 8),
                          const Icon(Icons.chevron_right, color: Color(0xffe0c0b1), size: 14),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text('Ready to drive?', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Go online to start receiving trip requests in your area.', style: TextStyle(color: Colors.grey[400]), textAlign: TextAlign.center),
                  const SizedBox(height: 24),
                    SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton.icon(
                      onPressed: () => context.push('/driver/active-trip'),
                      icon: const Icon(Icons.power_settings_new),
                      label: const Text('GO ONLINE', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff97316),
                        foregroundColor: const Color(0xff582200),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: () => context.push('/driver/vehicles'),
                      icon: const Icon(Icons.local_taxi),
                      label: const Text('MY VEHICLES', style: TextStyle(fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xfff97316),
                        side: const BorderSide(color: Color(0xff584237)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: () => context.push('/driver/telematics'),
                      icon: const Icon(Icons.settings_input_component),
                      label: const Text('TELEMATICS', style: TextStyle(fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xfff97316),
                        side: const BorderSide(color: Color(0xff584237)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: () => context.push('/driver/maintenance-schedule'),
                      icon: const Icon(Icons.calendar_month),
                      label: const Text('MAINTENANCE', style: TextStyle(fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xfff97316),
                        side: const BorderSide(color: Color(0xff584237)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton.icon(
                      onPressed: () => context.push('/driver/performance'),
                      icon: const Icon(Icons.speed),
                      label: const Text('PERFORMANCE', style: TextStyle(fontWeight: FontWeight.bold)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xfff97316),
                        side: const BorderSide(color: Color(0xff584237)),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Stats Grid
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => context.push('/driver/earnings'),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xff1c2b3c), // surface-container-high
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0xff584237)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Today's Earnings", style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                              const SizedBox(height: 4),
                              Text('R 1,240.50', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: const Color(0xfff97316), fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: const BoxDecoration(
                              color: Color(0x1Af97316),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.account_balance_wallet, color: Color(0xfff97316), size: 28),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 112,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xff122131),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xff584237)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Acceptance Rate', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('94%', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                            const Icon(Icons.trending_up, color: Color(0xff929ab2)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    height: 112,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xff122131),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xff584237)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Rating', style: TextStyle(color: Colors.grey[400], fontSize: 14)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('4.95', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                            const Icon(Icons.star, color: Color(0xfff97316)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Recent Activity
            Text('Recent Activity', style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildRecentActivityItem(
              icon: Icons.directions_car,
              title: 'Sandton City Mall',
              time: 'Today, 14:30',
              price: 'R 120.00',
              status: 'Completed',
            ),
            const SizedBox(height: 12),
            _buildRecentActivityItem(
              icon: Icons.directions_car,
              title: 'OR Tambo Int.',
              time: 'Today, 11:15',
              price: 'R 350.50',
              status: 'Completed',
            ),
            const SizedBox(height: 12),
            _buildRecentActivityItem(
              icon: Icons.local_mall,
              title: 'Rosebank Zone',
              time: 'Yesterday, 18:45',
              price: 'R 95.00',
              status: 'Completed',
              opacity: 0.8,
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff010f1f), // surface-container-lowest
          border: Border(top: BorderSide(color: Color(0xff584237))),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.dashboard, label: 'DASHBOARD', isSelected: true),
                _buildNavItem(icon: Icons.payments, label: 'EARNINGS'),
                _buildNavItem(icon: Icons.history, label: 'TRIPS'),
                _buildNavItem(icon: Icons.person, label: 'ACCOUNT'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRecentActivityItem({required IconData icon, required String title, required String time, required String price, required String status, double opacity = 1.0}) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff122131),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xff584237)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    color: Color(0x803e495d), // secondary-container/50
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 2),
                    Text(time, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
                  ],
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price, style: const TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 14)),
                const SizedBox(height: 2),
                Text(status, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, bool isSelected = false}) {
    return Container(
      width: 72,
      padding: const EdgeInsets.symmetric(vertical: 8),
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
            color: isSelected ? const Color(0xfff97316) : const Color(0xffe0c0b1),
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? const Color(0xfff97316) : const Color(0xffe0c0b1),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }
}
