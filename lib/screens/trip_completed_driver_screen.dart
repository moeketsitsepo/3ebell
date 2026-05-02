import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

class TripCompletedDriverScreen extends StatelessWidget {
  const TripCompletedDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              // Header
              Column(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      color: const Color(0xfff97316).withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xfff97316).withOpacity(0.3)),
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: Color(0xfff97316),
                      size: 56,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Trip Completed',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Great job, safely arrived.',
                    style: TextStyle(color: Color(0xffbcc7de), fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              
              // Earnings
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 32),
                decoration: BoxDecoration(
                  color: const Color(0xff0d1c2d),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xff273647)),
                ),
                child: Column(
                  children: const [
                    Text(
                      'TOTAL EARNINGS',
                      style: TextStyle(color: Color(0xffbcc7de), fontSize: 12, letterSpacing: 2),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'R 125.50',
                      style: TextStyle(
                        color: Color(0xfff97316),
                        fontSize: 56,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Details Bento Grid
              Column(
                children: [
                  // Commuter Card
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xff0d1c2d),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xff273647)),
                    ),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBZxw0BgkxwAaH_eIwtYy-yhDCj8I1a2uKKb9TWY67UeQaY92_wTWBXclMGCMBPxcryqq8GdB4ygthXgu5PImlOXAZtkrTtuJy2mJSvbHMEEX6tQF-NlA8XyLk1O_ZUdngo4AYPC6F5ic5MQoltLs4Eme2AKDAZ5a0snv1AJ_MTi0DOTLeScge4sFfmOvTOrg00GF-ztPpcrY4DMLEbH60BYZfXlqfwCUn273zrjeyge2c2eeZlCo3QeDle0c0rNwYVmqMUSvv5kYc'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Commuter', style: TextStyle(color: Color(0xffbcc7de), fontSize: 14)),
                              Text('Nelson', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xff273647),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: const [
                              Icon(Icons.star, color: Color(0xfff97316), size: 14),
                              SizedBox(width: 4),
                              Text('4.9', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Stats
                  Row(
                    children: [
                      Expanded(child: _buildSmallStat(Icons.schedule, '18', 'mins')),
                      const SizedBox(width: 12),
                      Expanded(child: _buildSmallStat(Icons.alt_route, '4.5', 'km')),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Timeline
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xff0d1c2d),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xff273647)),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          left: 7,
                          top: 24,
                          bottom: 24,
                          child: Container(width: 2, color: const Color(0xff273647)),
                        ),
                        Column(
                          children: [
                            _buildTimelinePoint('Pickup', 'Sandton City Mall', Colors.blueGrey),
                            const SizedBox(height: 24),
                            _buildTimelinePoint('Drop-off', 'Rosebank Zone', const Color(0xfff97316), isLast: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),

              // Actions
              SizedBox(
                width: double.infinity,
                height: 64,
                child: ElevatedButton.icon(
                  onPressed: () => context.go('/dashboard'),
                  icon: const Icon(Icons.home),
                  label: const Text('BACK TO DASHBOARD', style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff97316),
                    foregroundColor: const Color(0xff582200),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                height: 64,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.receipt_long),
                  label: const Text('VIEW EARNINGS DETAILS', style: TextStyle(fontWeight: FontWeight.bold)),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xffbcc7de),
                    side: const BorderSide(color: Color(0xff273647)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSmallStat(IconData icon, String value, String unit) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff0d1c2d),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff273647)),
      ),
      child: Column(
        children: [
          Icon(icon, color: const Color(0xffbcc7de), size: 28),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              Text(unit, style: TextStyle(color: const Color(0xffbcc7de), fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimelinePoint(String label, String value, Color color, {bool isLast = false}) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xff0d1c2d), width: 3),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Color(0xffbcc7de), fontSize: 14)),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
