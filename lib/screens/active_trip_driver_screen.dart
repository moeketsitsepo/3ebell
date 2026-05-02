import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ActiveTripDriverScreen extends StatelessWidget {
  const ActiveTripDriverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff051424),
      body: Stack(
        children: [
          // MAP CANVAS (Background)
          Positioned.fill(
            child: Image.network(
              'https://lh3.googleusercontent.com/aida-public/AB6AXuCND8Wr8jLg_ebq-Q3XnvLr0XfhXO8EnI-QTwSo79EUUeOwo0ZTBfo_WX44STrnQuuA8e_iG3LtiKoPx_stEpLsGpsLUyCLsWtfqqnHMfj8hpIItfFzOLyYh1tPKerWzjKdUeJCO_8LCfQcJh2v3pSFsDHHRBNbFQBi5Q4dJ2PFaBAA-UEhQ_5Y4tSJxPheTrqhK_0ao7Ov4VKXzf-dEtJRVnTwCXghF4PgnP3Ree5jpBusByn-8KvdCUF9tPCh4uooqEFW0EUAOZg',
              fit: BoxFit.cover,
              opacity: const AlwaysStoppedAnimation(0.8),
            ),
          ),
          // Dark Overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xff051424).withOpacity(0.8),
                    Colors.transparent,
                    const Color(0xff051424).withOpacity(0.9),
                  ],
                ),
              ),
            ),
          ),
          
          // Driver Location Pin with Pulse
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                _buildPulseCircle(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xff051424),
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xfff97316), width: 2),
                    boxShadow: [
                      BoxShadow(color: const Color(0xfff97316).withOpacity(0.3), blurRadius: 15),
                    ],
                  ),
                  child: const Icon(Icons.directions_car, color: Color(0xfff97316), size: 20),
                ),
              ],
            ),
          ),

          // Top Navigation Card
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff273647).withOpacity(0.95),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xff584237)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 30),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: 4,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Color(0xff273647),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: 0.33,
                        child: Container(color: const Color(0xfff97316)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color(0xff051424),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: const Color(0xff584237).withOpacity(0.5)),
                            ),
                            child: const Icon(Icons.turn_left, color: Color(0xfff97316), size: 36),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text('200m', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                      color: const Color(0xfff97316).withOpacity(0.1),
                                      child: const Text('NEXT', style: TextStyle(color: Color(0xfff97316), fontSize: 11, fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                const Text('Turn left on Rivonia Rd', style: TextStyle(color: Color(0xffbcc7de), fontSize: 16)),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: Colors.white),
                            onPressed: () => context.pop(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Map Controls
          Positioned(
            bottom: 300,
            right: 16,
            child: Column(
              children: [
                _buildMapControl(Icons.my_location),
                const SizedBox(height: 8),
                _buildMapControl(Icons.zoom_in_map),
              ],
            ),
          ),

          // Bottom Status Card
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
              decoration: BoxDecoration(
                color: const Color(0xff0d1c2d).withOpacity(0.95),
                borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
                border: const Border(top: BorderSide(color: Color(0xff584237))),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.6), blurRadius: 40),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    width: 48,
                    height: 6,
                    decoration: BoxDecoration(
                      color: const Color(0xff584237).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildCommuterProfile(),
                  const SizedBox(height: 24),
                  _buildTripBentoGrid(),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => context.go('/driver/trip-completed'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff97316),
                        foregroundColor: const Color(0xff582200),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        elevation: 10,
                        shadowColor: const Color(0xfff97316).withOpacity(0.3),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('START TRIP', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                          SizedBox(width: 8),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPulseCircle() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: const Color(0xfff97316).withOpacity(0.3),
      ),
    );
  }

  Widget _buildMapControl(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: const Color(0xff1c2b3c).withOpacity(0.9),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildCommuterProfile() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff122131).withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xff584237).withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuAFxtFvL0CHIciVUPdkRYEPciXqjq7ENE3e2d1JW_8vw51mE5t5QXZZs2UWlJxi9bngR3CqrwRBvwKK3sJLQ2xRZoZZ74BjwmOnxb0mmZg2-ktk-h70IL5ymMT8bSZheyI2HWH0gG1uonJc5HtMD-A2VNKmLU_WtSvMvtDPvktgD5CdZ0gBQfqxU7PD0UOXohv6txYZ3S3hb2Gsi-5US9McY6rFAB9S_YTN3Oi8grHrCUVIW3lxMALuC5rKJrPzyceESovIdlBMwhM'),
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xff1c2b3c),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff584237)),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.star, color: Color(0xfff97316), size: 10),
                      SizedBox(width: 2),
                      Text('4.8', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Nelson', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xff273647),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text('Commuter', style: TextStyle(color: Color(0xffbcc7de), fontSize: 11)),
                ),
              ],
            ),
          ),
          Row(
            children: [
              _buildProfileActionButton(Icons.chat),
              const SizedBox(width: 8),
              _buildProfileActionButton(Icons.call),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileActionButton(IconData icon) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xff051424),
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xff584237)),
      ),
      child: Icon(icon, color: const Color(0xfff97316), size: 20),
    );
  }

  Widget _buildTripBentoGrid() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xff122131).withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xff584237).withOpacity(0.4)),
          ),
          child: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xfff97316).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.my_location, color: Color(0xfff97316), size: 18),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('PICKUP POINT', style: TextStyle(color: Color(0xffbcc7de), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
                    Text('Sandton City Mall', style: TextStyle(color: Colors.white, fontSize: 16)),
                    Text('Entrance 4, Rivonia Road', style: TextStyle(color: Color(0xff929ab2), fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildMiniStat('DISTANCE', '1.2', 'km')),
            const SizedBox(width: 12),
            Expanded(child: _buildMiniStat('EST. ARRIVAL', '4', 'min')),
          ],
        ),
      ],
    );
  }

  Widget _buildMiniStat(String label, String value, String unit) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff122131).withOpacity(0.6),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xff584237).withOpacity(0.4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xffbcc7de), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.2)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              Text(unit, style: const TextStyle(color: Color(0xff929ab2), fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
