import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminOperationalDashboardScreen extends StatelessWidget {
  const AdminOperationalDashboardScreen({Key? key}) : super(key: key);

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
                        const Text('Operational Control', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        const Text('City-wide fleet status and demand monitoring.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
                        const SizedBox(height: 32),
                        _buildLiveMetrics(),
                        const SizedBox(height: 32),
                        _buildRegionalDemandTable(),
                        const SizedBox(height: 32),
                        _buildSystemAlerts(),
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
                  child: const Icon(Icons.hub, color: Color(0xfff97316), size: 24),
                ),
                const SizedBox(width: 12),
                const Text('EBell Ops', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          _buildSidebarItem(Icons.dashboard, 'Overview', onTap: () => context.go('/admin-overview')),
          _buildSidebarItem(Icons.settings_input_antenna, 'Live Ops', isSelected: true, onTap: () {}),
          _buildSidebarItem(Icons.map, 'Regional Analysis', onTap: () => context.push('/admin/heatmaps')),
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
          const Text('Live Updates: ON', style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDisBOx_oiQIjHNo2Gp95A3wvhLdsrAtbFMBfqM0qa7QFwxsU-MRD_r74vB8_m75y4SEidx8QW97Lx1En2A8KKu6CqAz3Fo_es9_9LHhjljw9hNrsYysScJbMg5PknzXnMXlITzbVTpAllcb-457bCdShjKD_rJi9bnoxMjf8II6Ff_XZenCZsWI-yIGEskSQHrnsx6KsJ5T1QZdBedC-UJR2MKQbCE6RdjMFdZ1slnfk5NxzeDtdNBBW1s8dda_5s9UJW3he-FgQA')),
        ],
      ),
    );
  }

  Widget _buildLiveMetrics() {
    return Row(
      children: [
        _buildMetricCard('Active Trips', '1,240', Icons.local_taxi, Colors.blue),
        const SizedBox(width: 24),
        _buildMetricCard('Wait Time', '4.2m', Icons.timer, Colors.green),
        const SizedBox(width: 24),
        _buildMetricCard('Demand Ratio', '1.8x', Icons.trending_up, Colors.orange),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 16),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildRegionalDemandTable() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(24),
            child: Align(alignment: Alignment.centerLeft, child: Text('Regional Demand Hubs', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20))),
          ),
          _buildRegionRow('Sandton Central', 'High', '85 Drivers'),
          _buildRegionRow('Soweto West', 'Extreme', '42 Drivers'),
          _buildRegionRow('Midrand / Waterfall', 'Moderate', '60 Drivers'),
          _buildRegionRow('Johannesburg CBD', 'High', '110 Drivers'),
        ],
      ),
    );
  }

  Widget _buildRegionRow(String name, String demand, String fleet) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xff273647)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(color: demand == 'Extreme' ? Colors.red.withOpacity(0.1) : Colors.orange.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
            child: Text(demand, style: TextStyle(color: demand == 'Extreme' ? Colors.red : Colors.orange, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
          Text(fleet, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildSystemAlerts() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.red.withOpacity(0.3))),
      child: Row(
        children: [
          const Icon(Icons.warning, color: Colors.red),
          const SizedBox(width: 16),
          const Expanded(child: Text('Connectivity issue detected in Midrand node. Impacting 12 drivers.', style: TextStyle(color: Colors.white, fontSize: 14))),
          TextButton(onPressed: () {}, child: const Text('INVESTIGATE', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
