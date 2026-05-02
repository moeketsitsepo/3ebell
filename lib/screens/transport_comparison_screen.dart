import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransportComparisonScreen extends StatelessWidget {
  const TransportComparisonScreen({Key? key}) : super(key: key);

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
        title: const Text('Compare Options', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildRouteHeader(),
            const SizedBox(height: 24),
            const Text('Available Modes', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildComparisonCard(
              mode: 'Minibus Taxi',
              time: '25 min',
              price: 'R 18.50',
              reliability: 'High',
              icon: Icons.directions_car,
              color: const Color(0xfff97316),
              isSelected: true,
            ),
            const SizedBox(height: 12),
            _buildComparisonCard(
              mode: 'Rea Vaya Bus',
              time: '35 min',
              price: 'R 22.00',
              reliability: 'Medium',
              icon: Icons.directions_bus,
              color: Colors.green,
            ),
            const SizedBox(height: 12),
            _buildComparisonCard(
              mode: 'Gautrain',
              time: '12 min',
              price: 'R 85.00',
              reliability: 'Very High',
              icon: Icons.train,
              color: Colors.blue,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.push('/wallet'),
                child: const Text('Book Selected Ride', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff97316),
                  foregroundColor: const Color(0xff582200),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Column(
            children: [
              const Icon(Icons.location_on, color: Color(0xfff97316), size: 20),
              Container(width: 2, height: 24, color: const Color(0xff273647)),
              const Icon(Icons.navigation, color: Colors.blue, size: 20),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('From: Soweto, JHB', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text('To: Sandton Central', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          IconButton(icon: const Icon(Icons.swap_vert, color: Color(0xffe0c0b1)), onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildComparisonCard({required String mode, required String time, required String price, required String reliability, required IconData icon, required Color color, bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? color : const Color(0xff273647), width: isSelected ? 2 : 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(icon, color: color, size: 32),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mode, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.timer, color: Color(0xffe0c0b1), size: 12),
                    const SizedBox(width: 4),
                    Text(time, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                    const SizedBox(width: 12),
                    const Icon(Icons.verified, color: Color(0xffe0c0b1), size: 12),
                    const SizedBox(width: 4),
                    Text(reliability, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 18)),
              if (isSelected) const Icon(Icons.check_circle, color: Color(0xfff97316), size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
