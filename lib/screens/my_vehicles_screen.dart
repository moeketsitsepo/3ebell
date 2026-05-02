import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyVehiclesScreen extends StatelessWidget {
  const MyVehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      appBar: AppBar(
        backgroundColor: const Color(0xff0b1120),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color(0xfff97316)),
          onPressed: () {},
        ),
        title: const Text('Vehicle Management', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
        actions: [
          IconButton(icon: const Icon(Icons.account_circle, color: Color(0xff94a3b8)), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('My Vehicles', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                    Text('Manage your registered fleet.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () => context.push('/driver/add-vehicle'),
                  icon: const Icon(Icons.add),
                  label: const Text('Add New'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff97316),
                    foregroundColor: const Color(0xff582200),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            _buildVehicleCard(
              context,
              name: 'Toyota Quantum',
              plate: 'ND 123-456',
              capacity: '15 Seats',
              status: 'Cleared',
              isActive: true,
              icon: Icons.directions_car,
            ),
            const SizedBox(height: 16),
            _buildVehicleCard(
              context,
              name: 'VW Crafter',
              plate: 'NUR 890-123',
              capacity: '22 Seats',
              status: 'Service Due',
              isActive: false,
              icon: Icons.directions_bus,
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildVehicleCard(BuildContext context, {required String name, required String plate, required String capacity, required String status, required bool isActive, required IconData icon}) {
    bool isServiceDue = status == 'Service Due';
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isActive ? const Color(0xfff97316).withOpacity(0.3) : const Color(0xff273647)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: const Color(0xff1c2b3c), borderRadius: BorderRadius.circular(8)),
                    child: Icon(icon, color: const Color(0xfff97316)),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                      Text(plate, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12, fontFamily: 'monospace')),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(isActive ? 'Active' : 'Standby', style: TextStyle(color: isActive ? const Color(0xfff97316) : const Color(0xffe0c0b1), fontSize: 10, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  Container(width: 8, height: 8, decoration: BoxDecoration(color: isActive ? const Color(0xfff97316) : const Color(0xff273647), shape: BoxShape.circle)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildMiniStat('Capacity', capacity)),
              const SizedBox(width: 12),
              Expanded(child: _buildMiniStat('Status', status, color: isServiceDue ? Colors.orange : Colors.green)),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xff273647)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Switch(value: isActive, onChanged: (v) {}, activeColor: const Color(0xfff97316)),
                  Text(isActive ? 'Active Vehicle' : 'Set Active', style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              if (isServiceDue)
                TextButton.icon(
                  onPressed: () => context.push('/driver/maintenance'),
                  icon: const Icon(Icons.build, size: 16, color: Color(0xfff97316)),
                  label: const Text('Schedule Service', style: TextStyle(color: Color(0xfff97316), fontSize: 12)),
                )
              else
                IconButton(icon: const Icon(Icons.delete, color: Color(0xffe0c0b1), size: 20), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMiniStat(String label, String value, {Color? color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xff0d1c2d), borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 10)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(color: color ?? Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
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
          _buildNavItem(Icons.directions_car, 'Fleet'),
          _buildNavItem(Icons.local_taxi, 'Vehicles', isSelected: true),
          _buildNavItem(Icons.analytics, 'Activity'),
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
        Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), fontSize: 10)),
      ],
    );
  }
}
