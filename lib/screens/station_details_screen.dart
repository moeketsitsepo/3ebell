import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StationDetailsScreen extends StatelessWidget {
  const StationDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildStationHeader(),
                  const SizedBox(height: 24),
                  const Text('Amenities', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildAmenitiesGrid(),
                  const SizedBox(height: 32),
                  const Text('Available Connections', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildConnectionsList(),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomSheet: _buildActionSheet(context),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 240,
      pinned: true,
      backgroundColor: const Color(0xff0b1120),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xfff97316)),
        onPressed: () => context.pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network('https://lh3.googleusercontent.com/aida-public/AB6AXuDisBOx_oiQIjHNo2Gp95A3wvhLdsrAtbFMBfqM0qa7QFwxsU-MRD_r74vB8_m75y4SEidx8QW97Lx1En2A8KKu6CqAz3Fo_es9_9LHhjljw9hNrsYysScJbMg5PknzXnMXlITzbVTpAllcb-457bCdShjKD_rJi9bnoxMjf8II6Ff_XZenCZsWI-yIGEskSQHrnsx6KsJ5T1QZdBedC-UJR2MKQbCE6RdjMFdZ1slnfk5NxzeDtdNBBW1s8dda_5s9UJW3he-FgQA', fit: BoxFit.cover),
            Container(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, const Color(0xff051424).withOpacity(0.8)]))),
          ],
        ),
      ),
    );
  }

  Widget _buildStationHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Park Station', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.green.withOpacity(0.4))),
              child: const Text('OPEN', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 12)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Icon(Icons.location_on, color: Color(0xfff97316), size: 16),
            SizedBox(width: 4),
            Text('Johannesburg Central', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'Johannesburg\'s primary transport hub, connecting Gautrain, Metrobus, Rea Vaya, and major minibus taxi routes across Gauteng.',
          style: TextStyle(color: Color(0xffbcc7de), fontSize: 14, height: 1.5),
        ),
      ],
    );
  }

  Widget _buildAmenitiesGrid() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        _buildAmenityChip(Icons.wifi, 'Free WiFi'),
        _buildAmenityChip(Icons.security, '24/7 Security'),
        _buildAmenityChip(Icons.atm, 'ATMs'),
        _buildAmenityChip(Icons.restaurant, 'Food Court'),
        _buildAmenityChip(Icons.local_parking, 'Secure Parking'),
      ],
    );
  }

  Widget _buildAmenityChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: const Color(0xfff97316), size: 18),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildConnectionsList() {
    return Column(
      children: [
        _buildConnectionItem('Gautrain', 'Platform 1', 'Next: 5 mins', Colors.blue),
        _buildConnectionItem('Rea Vaya C1', 'Bay 4', 'Next: 12 mins', Colors.green),
        _buildConnectionItem('Metrobus 42', 'Outer Loop', 'Next: 18 mins', Colors.yellow),
      ],
    );
  }

  Widget _buildConnectionItem(String mode, String location, String time, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          Container(width: 4, height: 40, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mode, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text(location, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              ],
            ),
          ),
          Text(time, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildActionSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Color(0xff0b1120),
        border: Border(top: BorderSide(color: Color(0xff1e293b))),
      ),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () => context.push('/hub/compare'),
              icon: const Icon(Icons.directions),
              label: const Text('Directions To Here', style: TextStyle(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1c2b3c),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xfff97316).withOpacity(0.1), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xfff97316))),
            child: const Icon(Icons.favorite_border, color: Color(0xfff97316)),
          ),
        ],
      ),
    );
  }
}
