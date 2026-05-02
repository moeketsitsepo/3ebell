import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class VehicleTelematicsScreen extends StatelessWidget {
  const VehicleTelematicsScreen({Key? key}) : super(key: key);

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
        title: const Text('Vehicle Telematics', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            _buildVehicleSelector(),
            const SizedBox(height: 32),
            _buildHealthStatusGrid(),
            const SizedBox(height: 32),
            _buildTelematicsCharts(),
          ],
        ),
      ),
    );
  }

  Widget _buildVehicleSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: const Color(0xff051424), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.directions_bus, color: Color(0xfff97316))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Toyota Quantum (Z-4902)', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Connected via EBell IoT Hub', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xff94a3b8)),
        ],
      ),
    );
  }

  Widget _buildHealthStatusGrid() {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        _buildHealthCard('Fuel Level', '78%', Icons.local_gas_station, Colors.green),
        _buildHealthCard('Tire Pressure', 'Normal', Icons.speed, Colors.green),
        _buildHealthCard('Battery Health', 'Good', Icons.battery_charging_full, Colors.green),
        _buildHealthCard('Brake Wear', 'Attention', Icons.build, Colors.orange),
      ],
    );
  }

  Widget _buildHealthCard(String label, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(20), border: Border.all(color: color.withOpacity(0.2))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: color, size: 28),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 10)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTelematicsCharts() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Real-time Performance', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Container(
          height: 150,
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.analytics_outlined, color: Color(0xfff97316), size: 48),
              const SizedBox(height: 12),
              const Text('Engine RPM & Temperature', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Text('Live data stream active', style: TextStyle(color: Colors.green.withOpacity(0.8), fontSize: 11)),
            ],
          ),
        ),
      ],
    );
  }
}
