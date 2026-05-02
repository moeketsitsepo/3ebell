import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminAuditLogsScreen extends StatelessWidget {
  const AdminAuditLogsScreen({Key? key}) : super(key: key);

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
                        const Text('Suspension Logs', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        const Text('History of account restrictions and safety violations.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
                        const SizedBox(height: 32),
                        _buildStatsRow(),
                        const SizedBox(height: 32),
                        _buildLogsContainer(context),
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
                  child: const Icon(Icons.shield, color: Color(0xfff97316), size: 24),
                ),
                const SizedBox(width: 12),
                const Text('EBell Admin', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          _buildSidebarItem(Icons.dashboard, 'Dashboard', onTap: () => context.go('/admin-overview')),
          _buildSidebarItem(Icons.group, 'User Management', onTap: () => context.push('/admin/users')),
          _buildSidebarItem(Icons.block, 'Suspension Logs', isSelected: true, onTap: () {}),
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
          IconButton(icon: const Icon(Icons.notifications, color: Color(0xff94a3b8)), onPressed: () {}),
          const SizedBox(width: 16),
          const CircleAvatar(radius: 16, backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuDisBOx_oiQIjHNo2Gp95A3wvhLdsrAtbFMBfqM0qa7QFwxsU-MRD_r74vB8_m75y4SEidx8QW97Lx1En2A8KKu6CqAz3Fo_es9_9LHhjljw9hNrsYysScJbMg5PknzXnMXlITzbVTpAllcb-457bCdShjKD_rJi9bnoxMjf8II6Ff_XZenCZsWI-yIGEskSQHrnsx6KsJ5T1QZdBedC-UJR2MKQbCE6RdjMFdZ1slnfk5NxzeDtdNBBW1s8dda_5s9UJW3he-FgQA')),
        ],
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        _buildStatCard('Active Suspensions', '14', Icons.warning, Colors.orange),
        const SizedBox(width: 24),
        _buildStatCard('Resolved This Month', '32', Icons.check_circle, Colors.green),
        const SizedBox(width: 24),
        _buildStatCard('Critical Violations', '5', Icons.gavel, Colors.red),
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

  Widget _buildLogsContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, color: Color(0xff94a3b8)),
                      hintText: 'Filter logs by user or reason...',
                      hintStyle: const TextStyle(color: Color(0xff584237)),
                      filled: true,
                      fillColor: const Color(0xff051424),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                IconButton(icon: const Icon(Icons.download, color: Color(0xfff97316)), onPressed: () {}),
              ],
            ),
          ),
          _buildLogsTable(),
        ],
      ),
    );
  }

  Widget _buildLogsTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(1),
        4: FixedColumnWidth(100),
      },
      children: [
        _buildTableHeader(),
        _buildLogRow('Sipho Ndlovu', 'Driver', '12 Oct 2023', 'Safety Report', 'Active'),
        _buildLogRow('Nomusa Zondi', 'Commuter', '05 Sep 2023', 'Policy Violation', 'Expired'),
        _buildLogRow('David Miller', 'Driver', '28 Aug 2023', 'Document Expiry', 'Resolved'),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return const TableRow(
      decoration: BoxDecoration(color: Color(0xff1c2b3c), border: Border(bottom: BorderSide(color: Color(0xff273647)))),
      children: [
        Padding(padding: EdgeInsets.all(16), child: Text('User Details', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(16), child: Text('Suspension Date', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(16), child: Text('Reason', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(16), child: Text('Status', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(16), child: Text('Action', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
      ],
    );
  }

  TableRow _buildLogRow(String name, String role, String date, String reason, String status) {
    Color statusColor = status == 'Active' ? Colors.red : (status == 'Resolved' ? Colors.green : Colors.grey);
    return TableRow(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xff1c2b3c)))),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(role, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.all(16), child: Text(date, style: const TextStyle(color: Colors.white))),
        Padding(padding: const EdgeInsets.all(16), child: Text(reason, style: const TextStyle(color: Colors.white, fontSize: 14))),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: statusColor.withOpacity(0.3))),
            child: Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextButton(onPressed: () {}, child: const Text('Review', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold))),
        ),
      ],
    );
  }
}
