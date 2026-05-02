import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShiftSummaryScreen extends StatelessWidget {
  const ShiftSummaryScreen({Key? key}) : super(key: key);

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
        title: const Text('Shift Summary', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(icon: const Icon(Icons.download, color: Color(0xfff97316)), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildShiftHeader(),
            const SizedBox(height: 24),
            const Text('Performance Highlights', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildPerformanceGrid(),
            const SizedBox(height: 32),
            const Text('Earning Breakdown', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildEarningsCard(),
            const SizedBox(height: 32),
            const Text('Shift Activity', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildActivityTimeline(),
          ],
        ),
      ),
    );
  }

  Widget _buildShiftHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff1c2b3c),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Column(
        children: [
          const CircleAvatar(radius: 40, backgroundColor: Color(0xff273647), child: Icon(Icons.event_available, color: Color(0xfff97316), size: 40)),
          const SizedBox(height: 16),
          const Text('Great job today, Tsepo!', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const Text('Shift: Oct 24, 08:00 AM - 16:00 PM', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildPerformanceGrid() {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 1.5,
      children: [
        _buildPerformanceItem(Icons.route, 'Total Distance', '142 km'),
        _buildPerformanceItem(Icons.timer, 'Online Time', '8h 12m'),
        _buildPerformanceItem(Icons.people, 'Passengers', '48'),
        _buildPerformanceItem(Icons.star, 'Rating', '4.95'),
      ],
    );
  }

  Widget _buildPerformanceItem(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xff273647))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: const Color(0xfff97316), size: 20),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        ],
      ),
    );
  }

  Widget _buildEarningsCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff584237))),
      child: Column(
        children: [
          _buildEarningRow('Fares', 'R 1,240.00'),
          const SizedBox(height: 8),
          _buildEarningRow('Tips', 'R 185.00'),
          const SizedBox(height: 8),
          _buildEarningRow('Incentives', 'R 50.00'),
          const Divider(color: Color(0xff584237), height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text('Total Earnings', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              Text('R 1,475.00', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 20)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEarningRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
        Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }

  Widget _buildActivityTimeline() {
    return Column(
      children: [
        _buildTimelineItem('15:45', 'Last Trip Completed', 'Sandton to Randburg', isLast: true),
        _buildTimelineItem('12:30', 'Lunch Break', '30 min duration'),
        _buildTimelineItem('08:15', 'First Trip Started', 'Soweto to JHB CBD'),
      ],
    );
  }

  Widget _buildTimelineItem(String time, String title, String subtitle, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(width: 12, height: 12, decoration: BoxDecoration(color: const Color(0xfff97316), shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2))),
            if (!isLast) Container(width: 2, height: 60, color: const Color(0xff273647)),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(time, style: const TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(width: 8),
                  Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }
}
