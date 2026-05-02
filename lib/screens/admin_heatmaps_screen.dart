import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminHeatmapsScreen extends StatelessWidget {
  const AdminHeatmapsScreen({Key? key}) : super(key: key);

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
                  child: Stack(
                    children: [
                      // Map Background
                      Positioned.fill(
                        child: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuCz9QVfsPWKWtsmGATqtEpA3uVeNNM6CyOiBB_lBVsA4DN6Nyuf3O-oYtaczsz0fL0F7RSzj3fGYbRF17ZOjZ24fTW1yTAjjfQOkAnut8-xTVWQ7Ye-BNxQu1g4gTkBwHjS-MlPgSv_0B1PBxum9dMAxm9R79LM1m2oKkpvzTkh3aExUc6RcPgLpuncvH8p_U_qiIbaNk2ySrOTQoyCDoe1PpqQXiqc5_sVveafGzgerBsYogDhX_JAwZZRG9PIDVGC6aI81pE25So',
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Heatmap Overlay (Mock)
                      Container(color: Colors.red.withOpacity(0.15)),
                      
                      // Floating Controls
                      Positioned(
                        top: 32,
                        left: 32,
                        child: _buildHeatmapControls(),
                      ),
                      
                      // Legend
                      Positioned(
                        bottom: 32,
                        right: 32,
                        child: _buildLegend(),
                      ),
                    ],
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
                  child: const Icon(Icons.map, color: Color(0xfff97316), size: 24),
                ),
                const SizedBox(width: 12),
                const Text('EBell Maps', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          _buildSidebarItem(Icons.dashboard, 'Overview', onTap: () => context.go('/admin-overview')),
          _buildSidebarItem(Icons.local_fire_department, 'Heatmaps', isSelected: true, onTap: () {}),
          _buildSidebarItem(Icons.route, 'Path Analysis', onTap: () {}),
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
          const Text('Demand Heatmaps', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          const Expanded(child: SizedBox()),
          IconButton(icon: const Icon(Icons.refresh, color: Color(0xff94a3b8)), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDisBOx_oiQIjHNo2Gp95A3wvhLdsrAtbFMBfqM0qa7QFwxsU-MRD_r74vB8_m75y4SEidx8QW97Lx1En2A8KKu6CqAz3Fo_es9_9LHhjljw9hNrsYysScJbMg5PknzXnMXlITzbVTpAllcb-457bCdShjKD_rJi9bnoxMjf8II6Ff_XZenCZsWI-yIGEskSQHrnsx6KsJ5T1QZdBedC-UJR2MKQbCE6RdjMFdZ1slnfk5NxzeDtdNBBW1s8dda_5s9UJW3he-FgQA')),
        ],
      ),
    );
  }

  Widget _buildHeatmapControls() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131).withOpacity(0.9), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647)), boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Overlay Settings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 16),
          _buildControlItem('Demand Intensity', true),
          _buildControlItem('Driver Distribution', false),
          _buildControlItem('Peak Pricing Areas', false),
        ],
      ),
    );
  }

  Widget _buildControlItem(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(width: 12, height: 12, decoration: BoxDecoration(color: isSelected ? const Color(0xfff97316) : const Color(0xff273647), borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 12),
          Text(label, style: TextStyle(color: isSelected ? Colors.white : const Color(0xff94a3b8), fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131).withOpacity(0.9), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Demand Scale', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10)),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildLegendColor(Colors.green, 'Low'),
              const SizedBox(width: 8),
              _buildLegendColor(Colors.yellow, 'Med'),
              const SizedBox(width: 8),
              _buildLegendColor(Colors.red, 'High'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendColor(Color color, String label) {
    return Row(
      children: [
        Container(width: 8, height: 8, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 9)),
      ],
    );
  }
}
