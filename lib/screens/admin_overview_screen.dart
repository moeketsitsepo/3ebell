import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class AdminOverviewScreen extends StatelessWidget {
  const AdminOverviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.grey),
          onPressed: () {},
        ),
        title: const Text('EBell', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w900)),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 16,
              backgroundImage: const NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuA4Qwr-5WAx-_d0WweX4kxPlp0SIQV2ATzqmvwaUCFoYrHGhleb3YXYWHnEFYFwmncFhkATLtyrSw83yM67jR90GUZjRUfO_TwwaGRY--heLz2bcBISl1Z1COkMyVrj6ifEUjFW0MbbKfSKKdPzaHqSWeCaY0_bIJsCvYI1SQEz49C4qBCqdoda3nmi2g5RVr4oxy882Pi7wa_1tqzWC25roExB106906ilJF2SZckdfDy28t7LtoUFdMxIglPUD4lo0gK1moC7SEs'),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overview', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text('Platform metrics and quick actions.', style: TextStyle(color: Colors.grey[400])),
            const SizedBox(height: 24),
            
            // Metrics Grid
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff122131),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xff584237)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('TOTAL REGISTERED', style: TextStyle(color: Colors.grey[400], fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                            const SizedBox(height: 4),
                            Text('10', style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: const Color(0xff2c3a4c),
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0x80584237)),
                          ),
                          child: const Icon(Icons.group, color: Color(0xffffb690), size: 24),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => context.push('/admin/verifications'),
                    child: _buildMetricCard(icon: Icons.pending_actions, iconColor: const Color(0xffbec6e0), value: '0', label: 'Pending Review'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildMetricCard(icon: Icons.check_circle, iconColor: const Color(0xffffb690), value: '8', label: 'Approved'),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(icon: Icons.cancel, iconColor: Colors.redAccent, value: '2', label: 'Rejected'),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: InkWell(
                    onTap: () => context.push('/admin/users'),
                    child: _buildMetricCard(icon: Icons.directions_car, iconColor: const Color(0xffbcc7de), value: '2', label: 'Drivers'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildMetricCard(icon: Icons.hail, iconColor: const Color(0xffbec6e0), value: '8', label: 'Commuters'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            
            // Setup Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xff2c3a4c), // surface-bright
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0x66f97316)), // primary-container/40
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: const Color(0x1Af97316),
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0x33f97316)),
                        ),
                        child: const Icon(Icons.build, color: Color(0xffffb690), size: 20),
                      ),
                      const SizedBox(width: 12),
                      Text('First-Time Admin Setup', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text('Configure your organization details, set up initial pricing tiers, and invite your first team members to get started.', style: TextStyle(color: Colors.grey[400])),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => context.push('/admin/settings'),
                      icon: const Icon(Icons.arrow_forward, size: 16),
                      label: const Text('Begin Setup', style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff97316),
                        foregroundColor: const Color(0xff582200),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
                _buildNavItem(icon: Icons.grid_view, label: 'Hub'),
                _buildNavItem(icon: Icons.explore, label: 'Live Map'),
                _buildNavItem(icon: Icons.stars, label: 'Plan'),
                _buildNavItem(icon: Icons.admin_panel_settings, label: 'Admin', isSelected: true),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard({required IconData icon, required Color iconColor, required String value, required String label}) {
    return Container(
      height: 100,
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
          Icon(icon, color: iconColor, size: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              Text(label, style: TextStyle(color: Colors.grey[400], fontSize: 12)),
            ],
          ),
        ],
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
