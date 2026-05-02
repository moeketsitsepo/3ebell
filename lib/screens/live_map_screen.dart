import 'package:flutter/material.dart';

class LiveMapScreen extends StatelessWidget {
  const LiveMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Simulated Map Background
          Positioned.fill(
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.saturation),
              child: Image.network(
                'https://lh3.googleusercontent.com/aida-public/AB6AXuBhzEyyisXEOW874NCkvMcURhSNYSZ9ZoeqYF2n9eVHbK_7w3WH2Tik1R_bXEzu9ShHqyUzJGO-U2WOHyQKj4y1zPevrb4Hi_xQzSIl72MKHaqmhB6MNo0Sm8YjjZvuXl2LqJV3so2nS73b6_TZsHZmfsykQBprc22m7ymxoaYPa93An86NYN71GugrAaOdBiZohSpssy3rmpWjWHOy1I1g9shQ9XdIXjP8xMl8WZDC-o8JVTeokBYB36D9QY6ZB1RX6o0PvIAhvq8',
                fit: BoxFit.cover,
                opacity: const AlwaysStoppedAnimation(0.7),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: const Color(0x99051424), // background/60
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xe6010f1f), Colors.transparent, Color(0x66010f1f)],
                ),
              ),
            ),
          ),

          // Simulated Map Markers
          Positioned(
            top: MediaQuery.of(context).size.height * 0.42,
            left: MediaQuery.of(context).size.width * 0.35,
            child: _buildMarker(Colors.yellowAccent),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.65,
            left: MediaQuery.of(context).size.width * 0.48,
            child: _buildMarker(Colors.greenAccent),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.30,
            left: MediaQuery.of(context).size.width * 0.65,
            child: _buildMarker(Colors.blueAccent),
          ),

          // User Location Pin
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5 - 24,
            left: MediaQuery.of(context).size.width * 0.5 - 24,
            child: Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0x333b82f6), // blue-500/20
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: const [BoxShadow(color: Colors.blue, blurRadius: 16)],
                  ),
                ),
              ),
            ),
          ),

          // Top App Bar Area (Custom Overlay)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              color: const Color(0xcc020617), // slate-950/80
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('EBell', style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w900, fontSize: 24, letterSpacing: -1)),
                    Row(
                      children: [
                        IconButton(icon: const Icon(Icons.notifications, color: Colors.grey), onPressed: () {}),
                        IconButton(icon: const Icon(Icons.account_circle, color: Colors.grey), onPressed: () {}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Interactive Overlays
          Positioned(
            top: MediaQuery.of(context).padding.top + 70,
            left: 16,
            right: 16,
            bottom: 90, // above bottom nav
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top Section: Share Location & Legend
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Legend Card
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xcc1c2b3c), // surface-container-high/80
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0x1aa78b7d)), // outline/10
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Vehicle Types', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                          const SizedBox(height: 8),
                          _buildLegendItem(Colors.yellowAccent, 'Minibus Taxi'),
                          const SizedBox(height: 4),
                          _buildLegendItem(Colors.greenAccent, 'Cab'),
                          const SizedBox(height: 4),
                          _buildLegendItem(Colors.blueAccent, 'Bus'),
                          const SizedBox(height: 4),
                          _buildLegendItem(Colors.purpleAccent, 'Hike'),
                          const SizedBox(height: 4),
                          _buildLegendItem(Colors.pinkAccent, 'Private'),
                          const SizedBox(height: 8),
                          const Divider(color: Color(0x1aa78b7d)),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text('You', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Share Location Button
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share, size: 18),
                      label: const Text('Share Location'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff97316),
                        foregroundColor: const Color(0xff582200),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        elevation: 8,
                      ),
                    ),
                  ],
                ),
                
                // Bottom Section: Controls
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      mini: true,
                      backgroundColor: const Color(0xe61c2b3c),
                      foregroundColor: Colors.white,
                      onPressed: () {},
                      child: const Icon(Icons.my_location),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xf21c2b3c), // surface-container-high/95
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: const Color(0x1aa78b7d)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Range', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
                              Text('10 km', style: TextStyle(color: Color(0xffffb690), fontWeight: FontWeight.bold, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              activeTrackColor: const Color(0xffffb690),
                              inactiveTrackColor: const Color(0xff010f1f),
                              thumbColor: Colors.white,
                              trackHeight: 4,
                            ),
                            child: Slider(
                              value: 45,
                              min: 0,
                              max: 100,
                              onChanged: (val) {},
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.draw, size: 18, color: Colors.white),
                                  label: const Text('Draw Route', style: TextStyle(color: Colors.white)),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: const Color(0xff273647),
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(Icons.route, size: 18, color: Colors.white),
                                  label: const Text('My Routes', style: TextStyle(color: Colors.white)),
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: const Color(0xff273647),
                                    side: BorderSide.none,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff020617), // slate-950
          border: Border(top: BorderSide(color: Color(0xff1e293b))), // slate-800
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(icon: Icons.map, label: 'MAP', isSelected: true),
                _buildNavItem(icon: Icons.group, label: 'HUB'),
                _buildNavItem(icon: Icons.dashboard, label: 'DASHBOARD'),
                _buildNavItem(icon: Icons.person, label: 'PROFILE'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMarker(Color color) {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: const Color(0xff010f1f),
        shape: BoxShape.circle,
        border: Border.all(color: color.withOpacity(0.5)),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
      ),
      child: Center(
        child: Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: color.withOpacity(0.8), blurRadius: 12)],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: color.withOpacity(0.6), blurRadius: 8)],
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(color: Color(0xffe0c0b1), fontSize: 12)),
      ],
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, bool isSelected = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: isSelected
              ? BoxDecoration(
                  color: const Color(0x1Af97316), // orange-500/10
                  borderRadius: BorderRadius.circular(12),
                )
              : null,
          child: Icon(
            icon,
            color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b), // orange-500 or slate-500
            size: 24,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? const Color(0xfff97316) : const Color(0xff64748b),
            fontSize: 10,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.1,
          ),
        ),
      ],
    );
  }
}
