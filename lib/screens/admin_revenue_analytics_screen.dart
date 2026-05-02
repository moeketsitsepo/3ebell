import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminRevenueAnalyticsScreen extends StatelessWidget {
  const AdminRevenueAnalyticsScreen({Key? key}) : super(key: key);

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
                        const Text('Revenue Analytics', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        const Text('Financial performance overview for the platform.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
                        const SizedBox(height: 32),
                        _buildSummaryStats(),
                        const SizedBox(height: 32),
                        _buildRevenueChartPlaceholder(),
                        const SizedBox(height: 32),
                        _buildTransactionHistory(),
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
                  child: const Icon(Icons.attach_money, color: Color(0xfff97316), size: 24),
                ),
                const SizedBox(width: 12),
                const Text('EBell Finance', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          _buildSidebarItem(Icons.dashboard, 'Overview', onTap: () => context.go('/admin-overview')),
          _buildSidebarItem(Icons.analytics, 'Revenue', isSelected: true, onTap: () {}),
          _buildSidebarItem(Icons.people, 'Payouts', onTap: () {}),
          _buildSidebarItem(Icons.settings, 'Settings', onTap: () => context.push('/admin/settings')),
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
          IconButton(icon: const Icon(Icons.download, color: Color(0xff94a3b8)), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDisBOx_oiQIjHNo2Gp95A3wvhLdsrAtbFMBfqM0qa7QFwxsU-MRD_r74vB8_m75y4SEidx8QW97Lx1En2A8KKu6CqAz3Fo_es9_9LHhjljw9hNrsYysScJbMg5PknzXnMXlITzbVTpAllcb-457bCdShjKD_rJi9bnoxMjf8II6Ff_XZenCZsWI-yIGEskSQHrnsx6KsJ5T1QZdBedC-UJR2MKQbCE6RdjMFdZ1slnfk5NxzeDtdNBBW1s8dda_5s9UJW3he-FgQA')),
        ],
      ),
    );
  }

  Widget _buildSummaryStats() {
    return Row(
      children: [
        _buildStatCard('Gross Volume', 'R 1.2M', '+12.5%', Icons.account_balance_wallet, Colors.green),
        const SizedBox(width: 24),
        _buildStatCard('Net Revenue', 'R 640K', '+8.2%', Icons.trending_up, Colors.blue),
        const SizedBox(width: 24),
        _buildStatCard('Active Payouts', 'R 420K', 'Pending', Icons.payments, Colors.orange),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, String trend, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: color, size: 24),
                Text(trend, style: TextStyle(color: trend.contains('+') ? Colors.green : Colors.orange, fontSize: 11, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildRevenueChartPlaceholder() {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.bar_chart, color: Color(0xfff97316), size: 64),
            const SizedBox(height: 16),
            const Text('Monthly Revenue Trend', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
            Text('Aggregated data from all vehicle types', style: TextStyle(color: const Color(0xffe0c0b1), fontSize: 14)),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Align(alignment: Alignment.centerLeft, child: Text('Recent Payouts', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
          ),
          _buildTransactionRow('Payout to Nelson #1128', 'Yesterday', 'R 4,200.00', 'Success'),
          _buildTransactionRow('Payout to Tsepo #4902', '2 days ago', 'R 5,150.00', 'Success'),
          _buildTransactionRow('Payout to Moliehi #8839', '3 days ago', 'R 3,800.00', 'Pending'),
        ],
      ),
    );
  }

  Widget _buildTransactionRow(String title, String date, String amount, String status) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xff273647)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(date, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(status, style: TextStyle(color: status == 'Success' ? Colors.green : Colors.orange, fontSize: 10, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
