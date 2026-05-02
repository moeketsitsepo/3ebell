import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DriverPerformanceScreen extends StatelessWidget {
  const DriverPerformanceScreen({Key? key}) : super(key: key);

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
        title: const Text('Performance Scorecard', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildOverallScore(),
            const SizedBox(height: 32),
            _buildMetricRow('Customer Rating', '4.9', Icons.star, Colors.orange),
            _buildMetricRow('Safe Driving Score', '98/100', Icons.security, Colors.green),
            _buildMetricRow('Fuel Efficiency', '12.4 km/l', Icons.local_gas_station, Colors.blue),
            _buildMetricRow('On-Time Arrival', '95%', Icons.timer, Colors.purple),
            const SizedBox(height: 32),
            _buildPerformanceSummary(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverallScore() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xfff97316).withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Text('Your Weekly Tier', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          const Text('PLATINUM', style: TextStyle(color: Color(0xfff97316), fontSize: 32, fontWeight: FontWeight.w900, letterSpacing: 2)),
          const SizedBox(height: 8),
          const Text('Top 5% of EBell Drivers', style: TextStyle(color: Colors.white, fontSize: 12)),
          const SizedBox(height: 24),
          LinearProgressIndicator(value: 0.9, backgroundColor: const Color(0xff051424), color: const Color(0xfff97316), minHeight: 8),
          const SizedBox(height: 12),
          const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Current: 450 pts', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 10)), Text('Next Goal: 500 pts', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 10))]),
        ],
      ),
    );
  }

  Widget _buildMetricRow(String label, String value, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: color, size: 24)),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
          const Spacer(),
          Text(value, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildPerformanceSummary() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.blue.withOpacity(0.05), borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.blue.withOpacity(0.2))),
      child: const Row(
        children: [
          Icon(Icons.info_outline, color: Colors.blue),
          const SizedBox(width: 16),
          Expanded(child: Text('Keep up the smooth braking! It improved your safety score by 4% this week.', style: TextStyle(color: Colors.white, fontSize: 13))),
        ],
      ),
    );
  }
}
