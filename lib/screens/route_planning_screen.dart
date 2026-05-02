import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutePlanningScreen extends StatelessWidget {
  const RoutePlanningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: Stack(
        children: [
          // Mock Map Background
          Positioned.fill(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCz9QVfsPWKWtsmGATqtEpA3uVeNNM6CyOiBB_lBVsA4DN6Nyuf3O-oYtaczsz0fL0F7RSzj3fGYbRF17ZOjZ24fTW1yTAjjfQOkAnut8-xTVWQ7Ye-BNxQu1g4gTkBwHjS-MlPgSv_0B1PBxum9dMAxm9R79LM1m2oKkpvzTkh3aExUc6RcPgLpuncvH8p_U_qiIbaNk2ySrOTQoyCDoe1PpqQXiqc5_sVveafGzgerBsYogDhX_JAwZZRG9PIDVGC6aI81pE25So',
              fit: BoxFit.cover,
            ),
          ),
          Container(color: const Color(0xff051424).withOpacity(0.4)),

          // Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _buildHeader(context),
          ),

          // Search Card
          Positioned(
            top: 100,
            left: 16,
            right: 16,
            child: _buildSearchCard(),
          ),

          // Transport Mode Selector (Floating)
          Positioned(
            bottom: 300,
            left: 16,
            right: 16,
            child: _buildTransportModes(),
          ),

          // Bottom Action Panel
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildActionPanel(context),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [const Color(0xff051424), const Color(0xff051424).withOpacity(0)],
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xfff97316)),
            onPressed: () => context.pop(),
          ),
          const Expanded(
            child: Text('Plan Your Route', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          IconButton(
            icon: const Icon(Icons.my_location, color: Color(0xfff97316)),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSearchCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff122131).withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 20)],
      ),
      child: Column(
        children: [
          _buildLocationInput(Icons.circle_outlined, 'Start Point', 'Current Location', Colors.blue),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(color: Color(0xff273647), height: 24),
          ),
          _buildLocationInput(Icons.location_on, 'Destination', 'Where to?', const Color(0xfff97316)),
        ],
      ),
    );
  }

  Widget _buildLocationInput(IconData icon, String label, String hint, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 10, fontWeight: FontWeight.bold)),
              Text(hint, style: const TextStyle(color: Colors.white, fontSize: 14)),
            ],
          ),
        ),
        const Icon(Icons.swap_vert, color: Color(0xff584237), size: 18),
      ],
    );
  }

  Widget _buildTransportModes() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildModeChip(Icons.directions_bus, 'Minibus', 'R 15.00', true),
          const SizedBox(width: 12),
          _buildModeChip(Icons.local_taxi, 'Cab', 'R 85.00', false),
          const SizedBox(width: 12),
          _buildModeChip(Icons.directions_train, 'Gautrain', 'R 42.00', false),
          const SizedBox(width: 12),
          _buildModeChip(Icons.directions_walk, 'Hike', 'R 10.00', false),
        ],
      ),
    );
  }

  Widget _buildModeChip(IconData icon, String label, String price, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xfff97316) : const Color(0xff122131).withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? const Color(0xfff97316) : const Color(0xff273647)),
      ),
      child: Column(
        children: [
          Icon(icon, color: isSelected ? const Color(0xff582200) : const Color(0xfff97316), size: 24),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(color: isSelected ? const Color(0xff582200) : Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(color: isSelected ? const Color(0xff582200).withOpacity(0.7) : const Color(0xffe0c0b1), fontSize: 10)),
        ],
      ),
    );
  }

  Widget _buildActionPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xff0b1120),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        border: Border(top: BorderSide(color: Color(0xff1e293b))),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Estimated Time', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                  Text('25 - 35 mins', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text('Total Cost', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
                  Text('R 15.00', style: TextStyle(color: Color(0xfff97316), fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () => context.go('/dashboard'),
              child: const Text('Start Journey', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xfff97316),
                foregroundColor: const Color(0xff582200),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
