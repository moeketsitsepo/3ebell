import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminUserManagementScreen extends StatelessWidget {
  const AdminUserManagementScreen({Key? key}) : super(key: key);

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
                        const Text('User Management', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        const Text('Monitor, verify, and manage all platform participants.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
                        const SizedBox(height: 32),
                        _buildMetricsGrid(),
                        const SizedBox(height: 32),
                        _buildUserTableContainer(context),
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
                  child: const Icon(Icons.local_taxi, color: Color(0xfff97316), size: 24),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('EBell', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.w900, fontSize: 24)),
                    Text('Admin Console', style: TextStyle(color: Color(0xff94a3b8), fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
          _buildSidebarItem(Icons.dashboard, 'Dashboard', onTap: () => context.go('/admin-overview')),
          _buildSidebarItem(Icons.group, 'Users', isSelected: true, onTap: () {}),
          _buildSidebarItem(Icons.verified_user, 'Verifications', onTap: () => context.push('/admin/verifications')),
          _buildSidebarItem(Icons.assessment, 'Reports', onTap: () {}),
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

  Widget _buildMetricsGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      mainAxisSpacing: 24,
      crossAxisSpacing: 24,
      childAspectRatio: 2.2,
      children: [
        _buildMetricCard('Total Active Users', '24,592', Icons.groups, color: const Color(0xfff97316)),
        _buildMetricCard('Registered Drivers', '3,840', Icons.directions_car, color: Colors.blue),
        _buildMetricCard('Pending Verifications', '142', Icons.pending_actions, color: Colors.red),
      ],
    );
  }

  Widget _buildMetricCard(String label, String value, IconData icon, {required Color color}) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: color, size: 28)),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserTableContainer(BuildContext context) {
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
                      hintText: 'Search by name, email, or ID...',
                      hintStyle: const TextStyle(color: Color(0xff584237)),
                      filled: true,
                      fillColor: const Color(0xff051424),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                _buildFilterDropdown('All Roles'),
                const SizedBox(width: 12),
                _buildFilterDropdown('All Statuses'),
              ],
            ),
          ),
          _buildTable(),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(color: const Color(0xff051424), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(width: 8),
          const Icon(Icons.expand_more, color: Color(0xffe0c0b1), size: 16),
        ],
      ),
    );
  }

  Widget _buildTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
        2: FlexColumnWidth(1),
        3: FlexColumnWidth(1),
        4: FixedColumnWidth(100),
      },
      children: [
        _buildTableHeader(),
        _buildTableRow('Sipho Ndlovu', 'sipho.n@example.com', 'Driver', 'Verified', '12 Oct 2023'),
        _buildTableRow('Thabo Mbeki', 'thabo.m@commuter.za', 'Commuter', 'Pending', '04 Nov 2023'),
        _buildTableRow('David Botha', 'd.botha88@gmail.com', 'Commuter', 'Verified', '01 Dec 2023'),
      ],
    );
  }

  TableRow _buildTableHeader() {
    return const TableRow(
      decoration: BoxDecoration(color: Color(0xff1c2b3c), border: Border(bottom: BorderSide(color: Color(0xff273647)))),
      children: [
        Padding(padding: EdgeInsets.all(16), child: Text('User', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(16), child: Text('Role', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(16), child: Text('Status', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(16), child: Text('Join Date', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
        Padding(padding: EdgeInsets.all(16), child: Text('Actions', style: TextStyle(color: Color(0xffe0c0b1), fontWeight: FontWeight.bold))),
      ],
    );
  }

  TableRow _buildTableRow(String name, String email, String role, String status, String date) {
    Color statusColor = status == 'Verified' ? Colors.green : Colors.orange;
    return TableRow(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xff1c2b3c)))),
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text(email, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
            ],
          ),
        ),
        Padding(padding: const EdgeInsets.all(16), child: Text(role, style: const TextStyle(color: Colors.white))),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: statusColor.withOpacity(0.3))),
            child: Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          ),
        ),
        Padding(padding: const EdgeInsets.all(16), child: Text(date, style: const TextStyle(color: Color(0xffe0c0b1)))),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: const [
              Icon(Icons.visibility, color: Color(0xff94a3b8), size: 18),
              SizedBox(width: 12),
              Icon(Icons.edit, color: Color(0xff94a3b8), size: 18),
            ],
          ),
        ),
      ],
    );
  }
}
