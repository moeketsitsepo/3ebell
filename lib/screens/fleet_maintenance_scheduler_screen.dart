import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FleetMaintenanceSchedulerScreen extends StatelessWidget {
  const FleetMaintenanceSchedulerScreen({Key? key}) : super(key: key);

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
        title: const Text('Maintenance Scheduler', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Book a Service', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Keep your vehicle in top condition with certified EBell hubs.', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 14)),
            const SizedBox(height: 32),
            _buildCalendarMock(),
            const SizedBox(height: 32),
            const Text('Select Time Slot', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _buildTimeSlot('08:00 AM', false),
                _buildTimeSlot('10:00 AM', true),
                _buildTimeSlot('01:00 PM', false),
                _buildTimeSlot('03:00 PM', false),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Preferred Hub', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            _buildHubSelector(),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => context.pop(),
                child: const Text('Confirm Appointment', style: TextStyle(fontWeight: FontWeight.bold)),
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

  Widget _buildCalendarMock() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(20), border: Border.all(color: const Color(0xff273647))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.chevron_left, color: Color(0xfff97316)),
              Text('October 2026', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              Icon(Icons.chevron_right, color: Color(0xfff97316)),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['M', 'T', 'W', 'T', 'F', 'S', 'S'].map((d) => Text(d, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12))).toList(),
          ),
          const SizedBox(height: 16),
          // Simple mock grid
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(31, (index) {
              int day = index + 1;
              bool isSelected = day == 28;
              return Center(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isSelected ? const Color(0xfff97316) : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(day.toString(), style: TextStyle(color: isSelected ? const Color(0xff582200) : Colors.white, fontSize: 12, fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSlot(String time, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xfff97316) : const Color(0xff122131),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isSelected ? const Color(0xfff97316) : const Color(0xff273647)),
      ),
      child: Text(time, style: TextStyle(color: isSelected ? const Color(0xff582200) : Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
    );
  }

  Widget _buildHubSelector() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: const Color(0xff122131), borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xff273647))),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: Color(0xfff97316)),
          const SizedBox(width: 16),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('EBell Hub - Midrand Central', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text('Open 07:00 AM - 08:00 PM', style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              ],
            ),
          ),
          const Icon(Icons.keyboard_arrow_down, color: Color(0xff94a3b8)),
        ],
      ),
    );
  }
}
