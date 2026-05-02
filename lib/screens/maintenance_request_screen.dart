import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MaintenanceRequestScreen extends StatelessWidget {
  const MaintenanceRequestScreen({Key? key}) : super(key: key);

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
        title: const Text('Schedule Maintenance', style: TextStyle(color: Color(0xfff97316), fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Vehicle Service', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
            const Text('Request maintenance for VW Crafter (NUR 890-123)', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 16)),
            const SizedBox(height: 32),
            _buildSelectionSection('Service Type', [
              'Oil Change',
              'Brake Inspection',
              'Tire Rotation',
              'Engine Diagnostic',
              'General Service',
            ]),
            const SizedBox(height: 24),
            _buildSelectionSection('Preferred Date', [
              'Tomorrow, Oct 28',
              'Wednesday, Oct 29',
              'Thursday, Oct 30',
            ]),
            const SizedBox(height: 32),
            const Text('Additional Notes', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Describe any issues or specific requests...',
                hintStyle: const TextStyle(color: Color(0xff584237)),
                filled: true,
                fillColor: const Color(0xff122131),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xff273647))),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xff273647))),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Submit Request', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xfff97316),
                  foregroundColor: const Color(0xff582200),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionSection(String title, List<String> options) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: options.map((opt) => _buildOptionChip(opt)).toList(),
        ),
      ],
    );
  }

  Widget _buildOptionChip(String label) {
    bool isSelected = label == 'General Service' || label == 'Tomorrow, Oct 28';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xfff97316).withOpacity(0.1) : const Color(0xff122131),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isSelected ? const Color(0xfff97316) : const Color(0xff273647)),
      ),
      child: Text(label, style: TextStyle(color: isSelected ? const Color(0xfff97316) : const Color(0xffe0c0b1), fontSize: 14, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
