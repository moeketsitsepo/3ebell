import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminFleetInsightsScreen extends StatelessWidget {
  const AdminFleetInsightsScreen({Key? key}) : super(key: key);

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
                        const Text('Fleet Insights', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        const Text('Real-time distribution and health metrics across Gauteng.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
                        const SizedBox(height: 32),
                        _buildSummaryCards(),
                        const SizedBox(height: 32),
                        _buildFleetDistributionMap(),
                        const SizedBox(height: 32),
                        _buildVehicleStatusList(),
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
                  child: const Icon(Icons.analytics, color: Color(0xfff97316), size: 24),
                ),
                const SizedBox(width: 12),
                const Text('EBell Fleet', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          _buildSidebarItem(Icons.dashboard, 'Dashboard', onTap: () => context.go('/admin-overview')),
          _buildSidebarItem(Icons.local_taxi, 'Fleet Status', isSelected: true, onTap: () {}),
          _buildSidebarItem(Icons.map, 'Route Coverage', onTap: () {}),
          _buildSidebarItem(Icons.settings, 'Operations', onTap: () => context.push('/admin/settings')),
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

  Widget _buildSummaryCards() {
    return Row(
      children: [
        _buildStatCard('Active Vehicles', '3,412', Icons.directions_car, Colors.blue),
        const SizedBox(width: 24),
        _buildStatCard('Fleet Utilization', '88%', Icons.trending_up, Colors.green),
        const SizedBox(width: 24),
        _buildStatCard('Service Required', '42', Icons.build_circle, Colors.orange),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: 16),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildFleetDistributionMap() {
    return Container(
      height: 400,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCz9QVfsPWKWtsmGATqtEpA3uVeNNM6CyOiBB_lBVsA4DN6Nyuf3O-oYtaczsz0fL0F7RSzj3fGYbRF17ZOjZ24fTW1yTAjjfQOkAnut8-xTVWQ7Ye-BNxQu1g4gTkBwHjS-MlPgSv_0B1PBxum9dMAxm9R79LM1m2oKkpvzTkh3aExUc6RcPgLpuncvH8p_U_qiIbaNk2ySrOTQoyCDoe1PpqQXiqc5_sVveafGzgerBsYogDhX_JAwZZRG9PIDVGC6aI81pE25So',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            child: const Text('Live Distribution', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: const Color(0xfff97316).withOpacity(0.9), shape: BoxShape.circle),
              child: const Icon(Icons.location_on, color: Colors.white, size: 32),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVehicleStatusList() {
    return Container(
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Align(alignment: Alignment.centerLeft, child: Text('Vehicle Health Alerts', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
          ),
          _buildHealthItem('Minibus #4902', 'Sandton Hub', 'Brake Wear Alert', Colors.orange),
          _buildHealthItem('Minibus #1128', 'Soweto Central', 'Service Overdue', Colors.red),
          _buildHealthItem('Minibus #8839', 'Pretoria East', 'Oil Change Required', Colors.orange),
        ],
      ),
    );
  }

  Widget _buildHealthItem(String id, String location, String alert, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(border: Border(top: BorderSide(color: Color(0xff273647)))),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Icon(Icons.build, color: color, size: 18)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(id, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(location, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              ],
            ),
          ),
          Text(alert, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }
}
