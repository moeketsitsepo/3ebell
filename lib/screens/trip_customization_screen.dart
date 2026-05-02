import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TripCustomizationScreen extends StatelessWidget {
  const TripCustomizationScreen({Key? key}) : super(key: key);

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
        title: const Text('Customize Your Trip', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Vehicle Amenities', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Select features you\'d like for your journey.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
            const SizedBox(height: 32),
            _buildAmenityItem('High-Speed WiFi', 'Stay connected during your ride.', Icons.wifi, 'R 5.00'),
            _buildAmenityItem('Air Conditioning', 'Keep cool in the Gauteng heat.', Icons.ac_unit, 'R 2.00'),
            _buildAmenityItem('Extra Luggage Space', 'For large bags and equipment.', Icons.luggage, 'R 10.00'),
            _buildAmenityItem('Quiet Mode', 'Minimal interaction from the driver.', Icons.volume_off, 'Free'),
            const SizedBox(height: 48),
            const Text('Trip Preferences', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildPreferenceToggle('Shared Ride', 'Allow other commuters to join.', true),
            _buildPreferenceToggle('Express Route', 'Avoid frequent stops.', false),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.go('/dashboard'),
                child: const Text('Confirm & Book', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
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

  Widget _buildAmenityItem(String title, String subtitle, IconData icon, String price) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xff051424), borderRadius: BorderRadius.circular(12)), child: Icon(icon, color: const Color(0xfff97316))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 11)),
              ],
            ),
          ),
          Text(price, style: const TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildPreferenceToggle(String title, String subtitle, bool value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: (val) {},
            activeColor: const Color(0xfff97316),
            activeTrackColor: const Color(0xfff97316).withOpacity(0.3),
            inactiveThumbColor: const Color(0xff94a3b8),
            inactiveTrackColor: const Color(0xff122131),
          ),
        ],
      ),
    );
  }
}
