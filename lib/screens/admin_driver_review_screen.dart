import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminDriverReviewScreen extends StatelessWidget {
  final String driverId;
  const AdminDriverReviewScreen({Key? key, required this.driverId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Breadcrumbs & Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    TextButton(onPressed: () => context.pop(), child: const Text('Driver Registry', style: TextStyle(color: Color(0xfff97316)))),
                    const Icon(Icons.chevron_right, color: Color(0xffe0c0b1), size: 16),
                    const Text('Sipho Ndlovu', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.check_circle),
                      label: const Text('Approve Driver'),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xfff97316), foregroundColor: const Color(0xff582200)),
                    ),
                    const SizedBox(width: 12),
                    OutlinedButton(onPressed: () {}, child: const Text('Edit Profile', style: TextStyle(color: Colors.white))),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Suspend Account'),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff93000a), foregroundColor: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Bento Grid Layout
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Panel
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: const Color(0xff111827),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xff1e293b)),
                    ),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAQMxse0M5L7n3Zg9sFKurTHG6dfCkt0fn_OPCg2jjlWfbes550J5wysRONWliW6m3xRt6vaYihLsnF1cjsFMLdtj1oqWL3wcVY7kwfEccDZielHqj74FJhS-mCE9j44erkOCOp63xCoFYxln40HAuKG78dCpzKT7FFPQII5gCyqxmM2TNd4UC5H8F2VrVLvOrAHqbiGVzlzYB0teh9IzRJR_iNDIT_jqFSO1MhzP4zftr6fvgujtAP1sAVtRtuTPZUnF-PVqxRUiQ'),
                        ),
                        const SizedBox(height: 16),
                        const Text('Sipho Ndlovu', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                        const Text('Active • Joined Oct 2021', style: TextStyle(color: Color(0xffe0c0b1))),
                        const SizedBox(height: 24),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: const Color(0xff122131),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: const Color(0xff273647)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.star, color: Colors.amber, size: 20),
                              SizedBox(width: 8),
                              Text('4.9', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                              Text(' (342 Reviews)', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                // Quick Stats
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: _buildStatCard(Icons.route, 'Total Trips', '1,248', '+12% this month')),
                          const SizedBox(width: 24),
                          Expanded(child: _buildStatCard(Icons.history, 'Years Active', '2.5', 'Since Oct 2021')),
                          const SizedBox(width: 24),
                          Expanded(child: _buildStatCard(Icons.directions_car, 'Current Vehicle', 'Toyota Quantum', 'ND 123-456')),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Documentation
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: const Color(0xff111827),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xff1e293b)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Documentation', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(child: _buildDocCard('Driver\'s License', 'Exp: 14 May 2026', true)),
                                const SizedBox(width: 16),
                                Expanded(child: _buildDocCard('PDP (Prof. Permit)', 'Exp: 02 Nov 2024', true)),
                                const SizedBox(width: 16),
                                Expanded(child: _buildDocCard('Vehicle Registration', 'Updated 2 hrs ago', false)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Trip History Placeholder
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xff111827),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xff1e293b)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Recent Trips', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  _buildTripTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String label, String value, String sub) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff1e293b)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xfff97316), size: 24),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 12),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
          Text(sub, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildDocCard(String title, String expiry, bool isVerified) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff051424),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isVerified ? const Color(0xff273647) : const Color(0xfff97316).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.description, color: Colors.white, size: 20),
              if (isVerified)
                const Icon(Icons.check_circle, color: Colors.green, size: 16)
              else
                const Icon(Icons.priority_high, color: Color(0xfff97316), size: 16),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          Text(expiry, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildTripTable() {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(4),
        2: FlexColumnWidth(2),
        3: FlexColumnWidth(1),
      },
      children: [
        TableRow(
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xff1e293b)))),
          children: [
            _tableHeader('Date & Time'),
            _tableHeader('Route'),
            _tableHeader('Earnings'),
            _tableHeader('Rating'),
          ],
        ),
        _tripRow('Today, 08:30 AM', 'Soweto -> CBD', 'R 350.00', '5.0'),
        _tripRow('Today, 06:15 AM', 'CBD -> Sandton', 'R 420.00', '4.8'),
        _tripRow('Yesterday, 17:45 PM', 'Sandton -> Soweto', 'R 480.00', '5.0'),
      ],
    );
  }

  Widget _tableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(text, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12, fontWeight: FontWeight.bold)),
    );
  }

  TableRow _tripRow(String dt, String route, String earn, String rate) {
    return TableRow(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xff1e293b)))),
      children: [
        Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text(dt, style: const TextStyle(color: Colors.white, fontSize: 13))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text(route, style: const TextStyle(color: Colors.white, fontSize: 13))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text(earn, style: const TextStyle(color: Color(0xfff97316), fontSize: 13, fontWeight: FontWeight.bold))),
        Padding(padding: const EdgeInsets.symmetric(vertical: 16.0), child: Text(rate, style: const TextStyle(color: Colors.white, fontSize: 13))),
      ],
    );
  }
}
