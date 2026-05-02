import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff020617),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xfff97316)),
          onPressed: () {},
        ),
        title: const Text('Wallet', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: const Color(0xff584237)),
                image: const DecorationImage(
                  image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuB-TKdnK8g5gWOpEe8MYeuEm_NdkLIUI0dlJ8AahRHjg3SUEZEXVpC8pISbU5FHZURHz_pgoPeI7S05I44V0jsVjlmbRG3aRnmb0r_VHb46fpuYH260q1BvfC3mZbCaZuDvPe2LmYbj-SrskZyDXKbEPtbSdmVTYtEuGEaTffpOxUL0T_XiG0uYGGZVKJycf2nqEaHf8cI9mhGglfyQDLUpi8MFj2WVHRGiMzZb2GsA_8QwktzG2EIWotiGIhjj0RggmUHH-LJXwF8'),
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
            // Summary Stats
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0xff122131),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0x4d584237)), // outline-variant/30
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.payments, color: Color(0xff929ab2), size: 16),
                            SizedBox(width: 4),
                            Text('Total Spent', style: TextStyle(color: Color(0xff929ab2), fontSize: 14)),
                          ],
                        ),
                        const Text('R 1,240.00', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text('This Month', style: TextStyle(color: Color(0xff3e495d), fontSize: 14)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 120,
                    decoration: BoxDecoration(
                      color: const Color(0x1af97316),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0x33f97316)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.account_balance_wallet, color: Color(0xfff97316), size: 16),
                            SizedBox(width: 4),
                            Text('Current Balance', style: TextStyle(color: Color(0xfff97316), fontSize: 14)),
                          ],
                        ),
                        const Text('R 450.50', style: TextStyle(color: Color(0xffffdbca), fontSize: 24, fontWeight: FontWeight.bold)),
                        Row(
                          children: const [
                            Icon(Icons.add_circle, color: Color(0xfff97316), size: 16),
                            SizedBox(width: 4),
                            Text('Top Up', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTab('All Transactions', isSelected: true),
                  const SizedBox(width: 8),
                  _buildTab('Trips'),
                  const SizedBox(width: 8),
                  _buildTab('Top Ups'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // History Section
            const Text('History', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),

            // Timeline: Today
            _buildDateHeader('Today'),
            _buildTransactionItem(
              icon: Icons.directions_bus,
              title: 'Morning Commute - Route 42',
              amount: '-R 45.00',
              subtitle: 'Cape Town CBD to Bellville',
              time: '08:14',
            ),
            const SizedBox(height: 8),
            _buildTransactionItem(
              icon: Icons.volunteer_activism,
              title: 'Driver Tip - Sipho',
              amount: '-R 10.00',
              subtitle: 'Great service!',
              time: '08:15',
            ),
            const SizedBox(height: 16),

            // Timeline: Yesterday
            _buildDateHeader('Yesterday'),
            _buildTransactionItem(
              icon: Icons.add_card,
              title: 'Wallet Top-up',
              amount: '+R 250.00',
              subtitle: 'Success',
              time: '17:42',
              isPositive: true,
            ),
            const SizedBox(height: 8),
            _buildTransactionItem(
              icon: Icons.directions_bus,
              title: 'Evening Return - Route 18',
              amount: '-R 35.00',
              subtitle: 'Pending',
              time: '16:30',
              isPending: true,
            ),
            const SizedBox(height: 16),

            // Timeline: 12 Oct 2023
            _buildDateHeader('12 Oct 2023'),
            _buildTransactionItem(
              icon: Icons.directions_bus,
              title: 'Morning Commute - Route 42',
              amount: '-R 45.00',
              subtitle: 'Cape Town CBD to Bellville',
              time: '08:05',
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff020617),
          border: Border(top: BorderSide(color: Color(0xff1e293b))),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.map, label: 'MAP'),
                _buildNavItem(icon: Icons.account_balance_wallet, label: 'WALLET'),
                _buildNavItem(icon: Icons.receipt_long, label: 'HISTORY', isSelected: true),
                _buildNavItem(icon: Icons.person, label: 'PROFILE'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xfff97316) : const Color(0xff122131),
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: const Color(0xff584237)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? const Color(0xff582200) : const Color(0xffe0c0b1),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
      child: Text(date, style: const TextStyle(color: Color(0xff3e495d), fontSize: 14)),
    );
  }

  Widget _buildTransactionItem({
    required IconData icon,
    required String title,
    required String amount,
    required String subtitle,
    required String time,
    bool isPositive = false,
    bool isPending = false,
  }) {
    return Opacity(
      opacity: isPending ? 0.75 : 1.0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xff0d1c2d), // surface-container-low
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0x4d584237)),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isPositive ? const Color(0x1af97316) : const Color(0xff1c2b3c),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: isPositive ? const Color(0xfff97316) : const Color(0xff3e495d)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14), overflow: TextOverflow.ellipsis),
                      ),
                      Text(amount, style: TextStyle(color: isPositive ? const Color(0xffffdbca) : Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (isPositive) ...[
                            Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                            const SizedBox(width: 4),
                          ] else if (isPending) ...[
                            Container(width: 8, height: 8, decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle)),
                            const SizedBox(width: 4),
                          ],
                          Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
                        ],
                      ),
                      Text(time, style: const TextStyle(color: Color(0xff3e495d), fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b),
          size: 24,
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
    );
  }
}
