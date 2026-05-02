import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportStatusScreen extends StatelessWidget {
  const ReportStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xfff97316)),
          onPressed: () => context.pop(),
        ),
        title: const Text('Report Status', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(icon: const Icon(Icons.notifications, color: Color(0xfff97316)), onPressed: () {}),
              Positioned(
                top: 12,
                right: 12,
                child: Container(width: 8, height: 8, decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle, border: Border.all(color: const Color(0xff0b1120), width: 1))),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('My Reports', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Track the resolution status of your submitted reports.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
            const SizedBox(height: 24),
            _buildReportCard(
              category: 'Driver Behavior',
              date: 'Submitted Oct 24, 08:15 AM',
              status: 'In Progress',
              description: 'Taxi driver was speeding excessively on N1 highway near Midrand. Swerving between lanes...',
              statusColor: const Color(0xfff97316),
              icon: Icons.speed,
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              category: 'Vehicle Safety',
              date: 'Submitted Oct 22, 17:30 PM',
              status: 'Under Review',
              description: 'Minibus door latch appears broken. The sliding door kept swinging slightly open during transit...',
              statusColor: const Color(0xff929ab2),
              icon: Icons.minor_crash,
            ),
            const SizedBox(height: 16),
            _buildReportCard(
              category: 'Station Facility',
              date: 'Submitted Oct 15, 19:45 PM',
              status: 'Resolved',
              description: 'Lighting out in the pedestrian walkway leading to platform 3 at Park Station. Very dark...',
              statusColor: Colors.green,
              icon: Icons.domain,
              isResolved: true,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildReportCard({required String category, required String date, required String status, required String description, required Color statusColor, required IconData icon, bool isResolved = false}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(width: 4, color: statusColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(icon, color: statusColor, size: 20),
                            const SizedBox(width: 8),
                            Text(category, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(20), border: Border.all(color: statusColor.withOpacity(0.3))),
                          child: Row(
                            children: [
                              Icon(isResolved ? Icons.check_circle : Icons.pending, color: statusColor, size: 14),
                              const SizedBox(width: 4),
                              Text(status, style: TextStyle(color: statusColor, fontSize: 10, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(date, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: const Color(0xff051424), borderRadius: BorderRadius.circular(8)),
                      child: Text(description, style: const TextStyle(color: Color(0x80e0c0b1), fontSize: 12), maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    const SizedBox(height: 16),
                    InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          Text(isResolved ? 'View Resolution' : 'View Details', style: TextStyle(color: isResolved ? const Color(0xffe0c0b1) : const Color(0xfff97316), fontSize: 14, fontWeight: FontWeight.bold)),
                          Icon(Icons.chevron_right, color: isResolved ? const Color(0xffe0c0b1) : const Color(0xfff97316), size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color(0xff0b1120),
        border: Border(top: BorderSide(color: Color(0xff1e293b))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.dashboard, 'Dashboard'),
          _buildNavItem(Icons.map, 'Live Map'),
          _buildNavItem(Icons.assignment_late, 'Reports', isSelected: true),
          _buildNavItem(Icons.person, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isSelected = false}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b)),
        const SizedBox(height: 4),
        Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
