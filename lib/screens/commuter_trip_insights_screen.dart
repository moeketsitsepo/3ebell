import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommuterTripInsightsScreen extends StatelessWidget {
  const CommuterTripInsightsScreen({Key? key}) : super(key: key);

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
        title: const Text('Travel Insights', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImpactCard(),
            const SizedBox(height: 32),
            const Text('Travel Patterns', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildPatternItem('Most Frequent Destination', 'Sandton City', Icons.location_on),
            _buildPatternItem('Preferred Mode', 'Gautrain / Bus', Icons.directions_bus),
            _buildPatternItem('Average Trip Time', '35 mins', Icons.timer),
            const SizedBox(height: 32),
            _buildSavingsChart(),
          ],
        ),
      ),
    );
  }

  Widget _buildImpactCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xff1e293b), Color(0xff0f172a)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          const Icon(Icons.eco, color: Colors.green, size: 48),
          const SizedBox(height: 16),
          const Text('Your Green Impact', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('You saved 12.5kg of CO2 this month by using public transport!', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 13), textAlign: TextAlign.center),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSimpleImpactStat('12', 'Trips'),
              _buildSimpleImpactStat('45km', 'Distance'),
              _buildSimpleImpactStat('R 320', 'Saved'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleImpactStat(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
      ],
    );
  }

  Widget _buildPatternItem(String label, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xfff97316), size: 20),
          const SizedBox(width: 16),
          Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 13)),
          const Spacer(),
          Text(value, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
        ],
      ),
    );
  }

  Widget _buildSavingsChart() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Monthly Savings', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Container(
          height: 120,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildBar(0.2, 'Jul'),
              _buildBar(0.5, 'Aug'),
              _buildBar(0.8, 'Sep'),
              _buildBar(1.0, 'Oct'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBar(double heightFactor, String month) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(width: 32, height: 60 * heightFactor, decoration: BoxDecoration(color: Colors.green.withOpacity(0.8), borderRadius: BorderRadius.circular(4))),
        const SizedBox(height: 8),
        Text(month, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 10)),
      ],
    );
  }
}
