import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SOSActiveScreen extends StatelessWidget {
  const SOSActiveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              // Urgent Alert Banner
              _buildAlertBanner(),
              const SizedBox(height: 24),
              // Live Map View
              _buildMapView(),
              const SizedBox(height: 24),
              // Dispatch Status
              _buildDispatchStatus(),
              const SizedBox(height: 32),
              // Cancel Action
              _buildCancelAction(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlertBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xff93000a),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xffffb4ab).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(color: const Color(0xff93000a).withOpacity(0.5), blurRadius: 40, spreadRadius: -10),
        ],
      ),
      child: Column(
        children: const [
          Icon(Icons.emergency, color: Color(0xffffb4ab), size: 72),
          SizedBox(height: 16),
          Text('Help is on the way', style: TextStyle(color: Color(0xffffb4ab), fontSize: 32, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Emergency services have been notified and are actively tracking your live location. Do not close this app.',
            style: TextStyle(color: Color(0xffffdad6), fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1c2b3c),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237)),
        image: const DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAMvr0rqvDOBg099N071bRVWk-9qQ_gSweP0QYhykHr_lLdJyNJjv8dnH1gitUaIJo8yPX7L1ksjTRqqWbTqoq6_54Msk6r94eEbFZSzcH55imFeC97BTNKIom48v8Z63s_SCu05c7jdewAJqpr91hExpu5Fuv7nMbT4ahEAh9m5bStaMi66VnlSS1y8ZU_RIK0RY2dTJ8qTylxRt-46vAgILe63x7gt89JZFjazK6EJCG5dWs-JvhsDEvpAjkYbrOll-OxlqhgPrM'),
          fit: BoxFit.cover,
          opacity: 0.4,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // User Pin Pulse
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xff93000a).withOpacity(0.2),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xff93000a).withOpacity(0.3)),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: const Color(0xff93000a),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
              boxShadow: const [BoxShadow(color: Color(0xffffb4ab), blurRadius: 10)],
            ),
          ),
          Positioned(
            bottom: 12,
            left: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xff010f1f).withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xff584237)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(width: 8, height: 8, decoration: const BoxDecoration(color: Color(0xff93000a), shape: BoxShape.circle)),
                      const SizedBox(width: 8),
                      const Text('Live Tracking', style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(Icons.my_location, color: Color(0xff93000a), size: 16),
                      SizedBox(width: 4),
                      Text('Accuracy: High', style: TextStyle(color: Color(0xff93000a), fontSize: 12, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDispatchStatus() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xff122131),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Dispatch Status', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          _buildTimelineItem(Icons.check, 'Signal Received', 'Command center alerted with exact coordinates.', isCompleted: true),
          _buildTimelineItem(Icons.local_police, 'Services Dispatched', 'Armed response unit is en route. ETA: 4 mins.', isActive: true),
          _buildTimelineItem(Icons.location_on, 'Arrival on Scene', 'Pending arrival of emergency services.', isPending: true),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(IconData icon, String title, String subtitle, {bool isCompleted = false, bool isActive = false, bool isPending = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isCompleted ? const Color(0xfff97316).withOpacity(0.2) : (isActive ? const Color(0xff93000a) : const Color(0xff273647)),
                shape: BoxShape.circle,
                border: Border.all(color: isCompleted ? const Color(0xfff97316).withOpacity(0.5) : Colors.transparent),
              ),
              child: Icon(icon, color: isCompleted ? const Color(0xfff97316) : (isActive ? Colors.white : Colors.white24), size: 18),
            ),
            if (!isPending)
              Container(width: 2, height: 40, color: isCompleted ? const Color(0xfff97316).withOpacity(0.3) : const Color(0xff273647)),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(color: isActive ? const Color(0xff93000a) : Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              Text(subtitle, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCancelAction(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton.icon(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.cancel, color: Color(0xff93000a)),
            label: const Text('Cancel SOS (if safe)', style: TextStyle(color: Color(0xff93000a), fontWeight: FontWeight.bold)),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Color(0xff93000a), width: 2),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
              backgroundColor: const Color(0xff010f1f),
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Only cancel if the immediate threat has passed and you are completely safe.',
          style: TextStyle(color: Color(0xffe0c0b1), fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
